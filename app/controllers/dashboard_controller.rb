class DashboardController < ApplicationController

  def index
    if logged_in?
      @bckImagelink = ""
      @section = (rand*10).to_i
      @firstnameDisplay = current_user.firstname[0]
      @ssms = Ssm.all
      @snmpdevices = Snmpdevice.all
      loginSuccess = "You are successfully logged in."
      @accrossLink = 'http://192.168.124.141/dominus/options/'

      if loginSuccess == notice
        @greet = "Welcome back #{current_user.firstname.capitalize}"
        @class = "alert alert-success"
      end
    else
      redirect_to login_path
    end
  end
end
