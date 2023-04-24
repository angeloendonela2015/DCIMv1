class NocsController < ApplicationController
  before_action :set_noc, only: %i[ show edit update destroy ]

  # GET /nocs or /nocs.json


  def index
    if logged_in?
      @nocs = Noc.all
      @ssms = Ssm.all
      @accrossLink = 'http://192.168.124.141/dominus/options/'

    else
      redirect_to login_path
    end
  end

  # GET /nocs/1 or /nocs/1.json
  def show
  end

  # GET /nocs/new
  def new
    if logged_in?
      @noc = Noc.new
      @ssms = Ssm.all
    else
      redirect_to login_path
    end
  end

  # GET /nocs/1/edit
  def edit
    if logged_in?
      @nocs = Noc.all
      @ssms = Ssm.all
    else
      redirect_to login_path
    end
  end

  # POST /nocs or /nocs.json
  def create
    if logged_in?
      @noc = Noc.new(noc_params)
      @ssms = Ssm.all
      respond_to do |format|
        if @noc.save
          format.html { redirect_to noc_url(@noc), notice: "Noc was successfully created." }
          format.json { render :show, status: :created, location: @noc }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @noc.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to login_path
    end
  end

  # PATCH/PUT /nocs/1 or /nocs/1.json
  def update
    if logged_in?
      respond_to do |format|
        if @noc.update(noc_params)
          format.html { redirect_to noc_url(@noc), notice: "Noc was successfully updated." }
          format.json { render :show, status: :ok, location: @noc }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @noc.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to login_path
    end
  end

  # DELETE /nocs/1 or /nocs/1.json
  def destroy
    if logged_in?
      @noc.destroy

      respond_to do |format|
        format.html { redirect_to nocs_url, notice: "Noc was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      redirect_to login_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_noc
      @noc = Noc.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def noc_params
      params.require(:noc).permit(:sensorename, :oid, :ipname, :ipaddress)
    end
end
