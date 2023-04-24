class DashboardController < ApplicationController

  def index
    if logged_in?
      @display = Display.find(1)
      @ssms = Ssm.all
      @bckImagelink = ""
      @section = (rand*10).to_i
      @firstnameDisplay = current_user.firstname[0]

      @snmpdevices = Snmpdevice.all
      @nocs = Noc.all
      loginSuccess = "You are successfully logged in."
      @accrossLink = 'http://192.168.124.141/dominus/options/'

      if loginSuccess == notice
        @greet = "Welcome back #{current_user.firstname.capitalize}"
        @class = "alert alert-success"
      end

      dashTime = Time.now
      @displayTime = dashTime.strftime("%I:%M %p")
      @displayDate = dashTime.strftime("%A %B %d %Y")

    else
      redirect_to login_path
    end
  end

  def edit

  end

end
