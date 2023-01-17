class DashboardController < ApplicationController

  def index
    if logged_in?
      @ssms = Ssm.paginate(page: params[:page], per_page: 10)
      @devices = Device.all

      loginSuccess = "You are successfully logged in."
      if loginSuccess == notice
        @greet = "Welcome back #{current_user.firstname.capitalize}"
        @class = "alert alert-success"
      end
    else
      redirect_to login_path
    end
  end

end
