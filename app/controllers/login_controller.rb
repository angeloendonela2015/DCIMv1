class LoginController < ApplicationController
  def new

    if logo_empty?
      @display = Display.find(1)
      @logoDisplay = @display.logo
    else
      @logoDisplay = '/assets/comspec.png'
    end

    @user = User.new
    @display = Display.all
    year = Date.today
    @currentYear = year.strftime('%Y')

    sbmitTagSuccess = "You successfully logged Out"
    sbmitTagDanger = "Incorrect credentials!"
    successLogin = "You are successfully logged in."
    if sbmitTagDanger == notice
      @notif = "text-light text-center rounded border border-1 bg-danger bg-opacity-75"
      @reboot = "d-none"
      return
    elsif sbmitTagSuccess == notice
      @notif = "text-light text-center bg-success rounded"
      @reboot = "d-none"
      return
    elsif successLogin == notice
      @notif = "text-light text-center bg-success rounded"
      return
    end
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      respond_to do |format|
        format.html { redirect_to root_path, notice: "You are successfully logged in." }
      end
    else
      respond_to do |format|
        format.html { redirect_to login_path, notice: "Incorrect credentials!" }
      end
    end
  end

  def destroy
    session[:user_id] = nil
    respond_to do |format|
      format.html { redirect_to login_path, notice: "You successfully logged Out" }
    end
  end
end
