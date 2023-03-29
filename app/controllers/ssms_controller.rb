class SsmsController < ApplicationController
  before_action :set_ssm, only: %i[ show edit update destroy ]

  # GET /ssms or /ssms.json
  def index
    if logged_in?
      @ssms = Ssm.where("unitname LIKE ? OR ipaddress LIKE ?", "%#{params[:ssm_search]}%", "%#{params[:ssm_search]}")
      @accrossLink = 'http://192.168.124.141/dominus/options/'
    else
      redirect_to login_path
    end
  end

  # GET /ssms/1 or /ssms/1.json
  def show
    if logged_in?
      @echoIP = @ssm.ipaddress
      @echoName =  @ssm.unitname
      rtt = Benchmark.realtime do
        pinger = Net::Ping::External.new(@echoIP)
        pinger.ping
      end

      if rtt
        if (rtt).round(4) < 3.0000
          @rttResult = (rtt).round(4)
        else
          @rttResult = (rtt).round(4)
        end

      else
        @rttResult = "failed"
      end
    else
      redirect_to login_path
    end
  end

  # GET /ssms/new
  def new
    if logged_in?
      @ssm = Ssm.new
    else
      redirect_to login_path
    end
  end

  # GET /ssms/1/edit
  def edit
  end

  # POST /ssms or /ssms.json
  def create
    if logged_in?
      @ssm = Ssm.new(ssm_params)

      respond_to do |format|
        if @ssm.save
          format.html { redirect_to ssm_url(@ssm), notice: "Ssm was successfully created." }
          format.json { render :show, status: :created, location: @ssm }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @ssm.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to login_path
    end
  end

  # PATCH/PUT /ssms/1 or /ssms/1.json
  def update
    if logged_in?
      respond_to do |format|
        if @ssm.update(ssm_params)
          format.html { redirect_to ssm_url(@ssm), notice: "Ssm was successfully updated." }
          format.json { render :show, status: :ok, location: @ssm }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @ssm.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to login_path
    end
  end

  # DELETE /ssms/1 or /ssms/1.json
  def destroy
    if logged_in?
      @ssm.destroy

      respond_to do |format|
        format.html { redirect_to ssms_url, notice: "Ssm was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      redirect_to login_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ssm
      @ssm = Ssm.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ssm_params
      params.require(:ssm).permit(:unitname, :ipaddress)
    end
end
