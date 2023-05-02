class DisplaysController < ApplicationController
  before_action :set_display, only: %i[ show edit update destroy ]

  # GET /displays or /displays.json
  def index
    if logged_in?
      @displays = Display.all
      redirect_to users_path
    else
      redirect_to login_path
    end
  end

  # GET /displays/1 or /displays/1.json
  def show
  end

  # GET /displays/new
  def new
    if logged_in?
      @display = Display.new
    else
      redirect_to login_path
    end
  end

  # GET /displays/1/edit
  def edit
  end

  # POST /displays or /displays.json
  def create
    if logged_in?
      @display = Display.new(display_params)
      @display.logo.attach(params[:display][:logo])
      @display.bckimage.attach(params[:display][:bckimage])
      respond_to do |format|
        if @display.save
          format.html { redirect_to display_url(@display), notice: "Display was successfully created." }
          format.json { render :show, status: :created, location: @display }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @display.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to login_path
    end
  end

  # PATCH/PUT /displays/1 or /displays/1.json
  def update
    if logged_in?
      respond_to do |format|
        if @display.update(display_params)
          format.html { redirect_to display_url(@display), notice: "Display was successfully updated." }
          format.json { render :show, status: :ok, location: @display }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @display.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to login_path
    end
  end

  # DELETE /displays/1 or /displays/1.json
  def destroy
    if logged_in?
      @display.destroy

      respond_to do |format|
        format.html { redirect_to displays_url, notice: "Display was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      redirect_to login_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_display
      @display = Display.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def display_params
      params.require(:display).permit(:title, :subtitle, :logo, :bckimage, :backcolor)
    end
end
