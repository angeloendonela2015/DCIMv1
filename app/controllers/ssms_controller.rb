class SsmsController < ApplicationController
  before_action :set_ssm, only: %i[ show edit update destroy ]

  # GET /ssms or /ssms.json
  def index
    if logged_in?
      @ssms = Ssm.where("unitname LIKE ? OR ipaddress LIKE ?", "%#{params[:ssm_search]}%", "%#{params[:ssm_search]}").paginate(page: params[:page], per_page: 10)
    else
      redirect_to login_path
    end
  end

  # GET /ssms/1 or /ssms/1.json
  def show
    if logged_in?
      @echoIP = @ssm.ipaddress
      @echoName =  @ssm.unitname

      ssm_ip  = @echoIP
      p1 = Net::Ping::External.new(ssm_ip,timeout=0.9)
      status_ip = p1.ping?
      if status_ip == true
        @echoStatus = 'Online'
      else
        @echoStatus = 'Offline'
        @include = redirect_to ssms_path(@ssm.id, notice: "Sorry this link cannot ping!")
      end

      starttime = Time.now
      Net::Ping::External.new(@ssm.ipaddress,timeout=0.9)
      @responsetime = Time.now - starttime
      @responseresult = "%f" % "#{ @responsetime }"
      @echo = @ssm.ipaddress
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
