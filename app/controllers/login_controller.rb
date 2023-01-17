class LoginController < ApplicationController
  def new
    @user = User.new
    year = Date.today
    @currentYear = year.strftime('%Y')

    sbmitTagSuccess = "You successfully logged Out"
    sbmitTagDanger = "Your username or password does not match"
    successLogin = "You are successfully logged in."
    if sbmitTagDanger == notice
      @notif = "text-light text-center bg-danger rounded"
      return
    elsif sbmitTagSuccess == notice
      @notif = "text-light text-center bg-success rounded"
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
        format.html { redirect_to login_path, notice: "Your username or password does not match" }
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
