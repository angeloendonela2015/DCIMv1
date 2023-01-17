class DevicesController < ApplicationController
  before_action :set_device, only: %i[ show edit update destroy ]

  # GET /devices or /devices.json
  def index
    if logged_in?
      @devices = Device.where("devices.unitname LIKE ? OR devices.ipaddress LIKE ?", "%#{params[:search]}%", "%#{params[:search]}")
    else
      redirect_to login_path
    end
  end

  # GET /devices/1 or /devices/1.json
  def show
    if logged_in?
      @devices = Device.all
    else
      redirect_to login_path
    end
  end

  # GET /devices/new
  def new
    if logged_in?
      @device = Device.new
    else
      redirect_to login_path
    end
  end

  # GET /devices/1/edit
  def edit
    if logged_in?
      @devices = Device.all
    else
      redirect_to login_path
    end
  end

  # POST /devices or /devices.json
  def create
    if logged_in?
      @device = Device.new(device_params)

      respond_to do |format|
        if @device.save
          format.html { redirect_to device_url(@device), notice: "Device was successfully created." }
          format.json { render :show, status: :created, location: @device }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @device.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to login_path
    end
  end

  # PATCH/PUT /devices/1 or /devices/1.json
  def update
    if logged_in?
      respond_to do |format|
        if @device.update(device_params)
          format.html { redirect_to device_url(@device), notice: "Device was successfully updated." }
          format.json { render :show, status: :ok, location: @device }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @device.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to login_path
    end
  end

  # DELETE /devices/1 or /devices/1.json
  def destroy
    if logged_in?
      @device.destroy

      respond_to do |format|
        format.html { redirect_to devices_url, notice: "Device was successfully deleted." }
        format.json { head :no_content }
      end
    else
      redirect_to login_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      @device = Device.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def device_params
      params.require(:device).permit(:unitname, :ipaddress, :sensore_type, :community, :oid, :alarm)
    end
end
