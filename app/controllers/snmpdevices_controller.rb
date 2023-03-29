class SnmpdevicesController < ApplicationController
  before_action :set_snmpdevice, only: %i[ show edit update destroy ]

  # GET /snmpdevices or /snmpdevices.json
  def index
    @snmpdevices = Snmpdevice.all
    @accrossLink = 'http://192.168.124.141/dominus/options/'
  end

  # GET /snmpdevices/1 or /snmpdevices/1.json
  def show
    if logged_in?
      @host = @snmpdevice.device_ip.freeze
      typeValue = { 'OCTET STRING' => :to_f, 'INTEGER' => :to_i }.freeze
      registers1 = [ @snmpdevice.oid_status1]
      registers2 = [ @snmpdevice.oid_status2]
      registers3 = [ @snmpdevice.oid_status3]
      registers4 = [ @snmpdevice.oid_status4]
      registers5 = [ @snmpdevice.oid_status5]
      registers6 = [ @snmpdevice.oid_status6]
      registers7 = [ @snmpdevice.oid_status7]
      registers8 = [ @snmpdevice.oid_status8]

      params_array1 = {}
      params_array2 = {}
      params_array3 = {}
      params_array4 = {}
      params_array5 = {}
      params_array6 = {}
      params_array7 = {}
      params_array8 = {}

      p1 = Net::Ping::External.new(@snmpdevice.device_ip,timeout=0.9)
      status_ip = p1.ping?
      if status_ip == true
        if @snmpdevice.outlet_type == "MiniBoot_Outlet_4"

          SNMP::Manager.open(host: @host, :community => @snmpdevice.community_type) do |manager1|
            manager1.load_module('UPS-MIB')
            response1 = manager1.get(registers1)
            response1.each_varbind do |vb|
              if method = typeValue[vb.value.asn1_type]
                params_array1 = vb.value.send(method)
              else
                puts "Type '#{vb.value.asn1_type}' not recognized!"
              end
            end
          end
          SNMP::Manager.open(host: @host, :community => @snmpdevice.community_type) do |manager2|
            manager2.load_module('UPS-MIB')
            response2 = manager2.get(registers2)
            response2.each_varbind do |vb|
              if method2 = typeValue[vb.value.asn1_type]
                params_array2 = vb.value.send(method2)
              else
                puts "Type '#{vb.value.asn1_type}' not recognized!"
              end
            end
          end
          SNMP::Manager.open(host: @host, :community => @snmpdevice.community_type) do |manager3|
            manager3.load_module('UPS-MIB')
            response3 = manager3.get(registers3)
            response3.each_varbind do |vb|
              if method3 = typeValue[vb.value.asn1_type]
                params_array3 = vb.value.send(method3)
              else
                puts "Type '#{vb.value.asn1_type}' not recognized!"
              end
            end
          end
          SNMP::Manager.open(host: @host, :community => @snmpdevice.community_type) do |manager4|
            manager4.load_module('UPS-MIB')
            response4 = manager4.get(registers4)
            response4.each_varbind do |vb|
              if method4 = typeValue[vb.value.asn1_type]
                params_array4 = vb.value.send(method4)
              else
                puts "Type '#{vb.value.asn1_type}' not recognized!"
              end
            end
          end


          @status1 = pp params_array1
          if @status1 == 1
            @status1 = "ON"
          else
            @status1 = "OFF"
          end

          @status2 = pp params_array2
          if @status2 == 1
            @status2 = "ON"
          else
            @status2 = "OFF"
          end

          @status3 = pp params_array3
          if @status3 == 1
            @status3 = "ON"
          else
            @status3 = "OFF"
          end

          @status4 = pp params_array4
          if @status4 == 1
            @status4 = "ON"
          else
            @status4 = "OFF"
          end

          statusS1 = pp params_array1
          statusS2 = pp params_array2
          statusS3 = pp params_array3
          statusS4 = pp params_array4
          @outputAll = 4
          @TotalStat = statusS1 + statusS2 + statusS3 + statusS4
          ontotal = @TotalStat
          @SubTotal = 4 - ontotal

        elsif @snmpdevice.outlet_type == "MiniBoot_Outlet_8"
          SNMP::Manager.open(host: @host, :community => @snmpdevice.community_type) do |manager1|
            manager1.load_module('UPS-MIB')
            response1 = manager1.get(registers1)
            response1.each_varbind do |vb|
              if method = typeValue[vb.value.asn1_type]
                params_array1 = vb.value.send(method)
              else
                puts "Type '#{vb.value.asn1_type}' not recognized!"
              end
            end
          end
          SNMP::Manager.open(host: @host, :community => @snmpdevice.community_type) do |manager2|
            manager2.load_module('UPS-MIB')
            response2 = manager2.get(registers2)
            response2.each_varbind do |vb|
              if method2 = typeValue[vb.value.asn1_type]
                params_array2 = vb.value.send(method2)
              else
                puts "Type '#{vb.value.asn1_type}' not recognized!"
              end
            end
          end
          SNMP::Manager.open(host: @host, :community => @snmpdevice.community_type) do |manager3|
            manager3.load_module('UPS-MIB')
            response3 = manager3.get(registers3)
            response3.each_varbind do |vb|
              if method3 = typeValue[vb.value.asn1_type]
                params_array3 = vb.value.send(method3)
              else
                puts "Type '#{vb.value.asn1_type}' not recognized!"
              end
            end
          end
          SNMP::Manager.open(host: @host, :community => @snmpdevice.community_type) do |manager4|
            manager4.load_module('UPS-MIB')
            response4 = manager4.get(registers4)
            response4.each_varbind do |vb|
              if method4 = typeValue[vb.value.asn1_type]
                params_array4 = vb.value.send(method4)
              else
                puts "Type '#{vb.value.asn1_type}' not recognized!"
              end
            end
          end
          SNMP::Manager.open(host: @host, :community => @snmpdevice.community_type) do |manager5|
            manager5.load_module('UPS-MIB')
            response5 = manager5.get(registers5)
            response5.each_varbind do |vb|
              if method5 = typeValue[vb.value.asn1_type]
                params_array5 = vb.value.send(method5)
              else
                puts "Type '#{vb.value.asn1_type}' not recognized!"
              end
            end
          end
          SNMP::Manager.open(host: @host, :community => @snmpdevice.community_type) do |manager6|
            manager6.load_module('UPS-MIB')
            response6 = manager6.get(registers6)
            response6.each_varbind do |vb|
              if method6 = typeValue[vb.value.asn1_type]
                params_array6 = vb.value.send(method6)
              else
                puts "Type '#{vb.value.asn1_type}' not recognized!"
              end
            end
          end
          SNMP::Manager.open(host: @host, :community => @snmpdevice.community_type) do |manager7|
            manager7.load_module('UPS-MIB')
            response7 = manager7.get(registers7)
            response7.each_varbind do |vb|
              if method7 = typeValue[vb.value.asn1_type]
                params_array7 = vb.value.send(method7)
              else
                puts "Type '#{vb.value.asn1_type}' not recognized!"
              end
            end
          end
          SNMP::Manager.open(host: @host, :community => @snmpdevice.community_type) do |manager8|
            manager8.load_module('UPS-MIB')
            response8 = manager8.get(registers8)
            response8.each_varbind do |vb|
              if method8 = typeValue[vb.value.asn1_type]
                params_array8 = vb.value.send(method8)
              else
                puts "Type '#{vb.value.asn1_type}' not recognized!"
              end
            end
          end


          @status1 = pp params_array1
          if @status1 == 1
            @status1 = "ON"
          else
            @status1 = "OFF"
          end

          @status2 = pp params_array2
          if @status2 == 1
            @status2 = "ON"
          else
            @status2 = "OFF"
          end

          @status3 = pp params_array3
          if @status3 == 1
            @status3 = "ON"
          else
            @status3 = "OFF"
          end

          @status4 = pp params_array4
          if @status4 == 1
            @status4 = "ON"
          else
            @status4 = "OFF"
          end

          @status5 = pp params_array5
          if @status5 == 1
            @status5 = "ON"
          else
            @status5 = "OFF"
          end

          @status6 = pp params_array6
          if @status6 == 1
            @status6 = "ON"
          else
            @status6 = "OFF"
          end

          @status7 = pp params_array7
          if @status7 == 1
            @status7 = "ON"
          else
            @status7 = "OFF"
          end

          @status8 = pp params_array8
          if @status8 == 1
            @status8 = "ON"
          else
            @status8 = "OFF"
          end

          statusS1 = pp params_array1
          statusS2 = pp params_array2
          statusS3 = pp params_array3
          statusS4 = pp params_array4
          statusS5 = pp params_array5
          statusS6 = pp params_array6
          statusS7 = pp params_array7
          statusS8 = pp params_array8

          @outputAll = 8
          @TotalStat = statusS1 + statusS2 + statusS3 + statusS4 +  statusS5 +  statusS6 +  statusS7 +  statusS8
          ontotal = @TotalStat
          @SubTotal = 8 - ontotal

        end
        @intRes = "Online"
      else
        @intRes = "Offline"
        @inActive = "d-none"
      end


      ssm_ip  = @snmpdevice.device_ip
      p1 = Net::Ping::External.new(ssm_ip,timeout=0.9)
      status_ip = p1.ping?
      if status_ip == true
        @status = 'Online'
        if @snmpdevice.outlet_type == "MiniBoot_Outlet_4"
          @outlet = "Max outlet 4"
          @divHide = "d-none"
          host = @snmpdevice.device_ip.freeze
          typeValue = { 'OCTET STRING' => :to_s }.freeze
          registersName1 = [ @snmpdevice.oid_outletname1 ]
          registersName2 = [ @snmpdevice.oid_outletname2 ]
          registersName3 = [ @snmpdevice.oid_outletname3 ]
          registersName4 = [ @snmpdevice.oid_outletname4 ]

          paramsname_array1 = {}
          paramsname_array2 = {}
          paramsname_array3 = {}
          paramsname_array4 = {}

          SNMP::Manager.open(host: host, :community => @snmpdevice.community_type) do |managername1|
            managername1.load_module('UPS-MIB')
            response1 = managername1.get(registersName1)
            response1.each_varbind do |vb|
              if method = typeValue[vb.value.asn1_type]
                paramsname_array1 = vb.value.send(method)
              else
                puts "Type '#{vb.value.asn1_type}' not recognized!"
              end
            end
          end

          SNMP::Manager.open(host: host, :community => @snmpdevice.community_type) do |managername2|
            managername2.load_module('UPS-MIB')
            response2 = managername2.get(registersName2)
            response2.each_varbind do |vb|
              if method = typeValue[vb.value.asn1_type]
                paramsname_array2 = vb.value.send(method)
              else
                puts "Type '#{vb.value.asn1_type}' not recognized!"
              end
            end
          end

          SNMP::Manager.open(host: host, :community => @snmpdevice.community_type) do |managername3|
            managername3.load_module('UPS-MIB')
            response3 = managername3.get(registersName3)
            response3.each_varbind do |vb|
              if method = typeValue[vb.value.asn1_type]
                paramsname_array3 = vb.value.send(method)
              else
                puts "Type '#{vb.value.asn1_type}' not recognized!"
              end
            end
          end

          SNMP::Manager.open(host: host, :community => @snmpdevice.community_type) do |managername4|
            managername4.load_module('UPS-MIB')
            response4 = managername4.get(registersName4)
            response4.each_varbind do |vb|
              if method = typeValue[vb.value.asn1_type]
                paramsname_array4 = vb.value.send(method)
              else
                puts "Type '#{vb.value.asn1_type}' not recognized!"
              end
            end
          end

          @oidName1 = pp paramsname_array1
          @oidName2 = pp paramsname_array2
          @oidName3 = pp paramsname_array3
          @oidName4 = pp paramsname_array4
        elsif @snmpdevice.outlet_type == "MiniBoot_Outlet_8"
          @outlet = "Max outlet 8"
          host = @snmpdevice.device_ip.freeze
          typeValue = { 'OCTET STRING' => :to_s }.freeze
          registersName1 = [ @snmpdevice.oid_outletname1 ]
          registersName2 = [ @snmpdevice.oid_outletname2 ]
          registersName3 = [ @snmpdevice.oid_outletname3 ]
          registersName4 = [ @snmpdevice.oid_outletname4 ]
          registersName5 = [ @snmpdevice.oid_outletname5 ]
          registersName6 = [ @snmpdevice.oid_outletname6 ]
          registersName7 = [ @snmpdevice.oid_outletname7 ]
          registersName8 = [ @snmpdevice.oid_outletname8 ]

          paramsname_array1 = {}
          paramsname_array2 = {}
          paramsname_array3 = {}
          paramsname_array4 = {}
          paramsname_array5 = {}
          paramsname_array6 = {}
          paramsname_array7 = {}
          paramsname_array8 = {}

          SNMP::Manager.open(host: host, :community => @snmpdevice.community_type) do |managername1|
            managername1.load_module('UPS-MIB')
            response1 = managername1.get(registersName1)
            response1.each_varbind do |vb|
              if method = typeValue[vb.value.asn1_type]
                paramsname_array1 = vb.value.send(method)
              else
                puts "Type '#{vb.value.asn1_type}' not recognized!"
              end
            end
          end

          SNMP::Manager.open(host: host, :community => @snmpdevice.community_type) do |managername2|
            managername2.load_module('UPS-MIB')
            response2 = managername2.get(registersName2)
            response2.each_varbind do |vb|
              if method = typeValue[vb.value.asn1_type]
                paramsname_array2 = vb.value.send(method)
              else
                puts "Type '#{vb.value.asn1_type}' not recognized!"
              end
            end
          end

          SNMP::Manager.open(host: host, :community => @snmpdevice.community_type) do |managername3|
            managername3.load_module('UPS-MIB')
            response3 = managername3.get(registersName3)
            response3.each_varbind do |vb|
              if method = typeValue[vb.value.asn1_type]
                paramsname_array3 = vb.value.send(method)
              else
                puts "Type '#{vb.value.asn1_type}' not recognized!"
              end
            end
          end

          SNMP::Manager.open(host: host, :community => @snmpdevice.community_type) do |managername4|
            managername4.load_module('UPS-MIB')
            response4 = managername4.get(registersName4)
            response4.each_varbind do |vb|
              if method = typeValue[vb.value.asn1_type]
                paramsname_array4 = vb.value.send(method)
              else
                puts "Type '#{vb.value.asn1_type}' not recognized!"
              end
            end
          end

          SNMP::Manager.open(host: host, :community => @snmpdevice.community_type) do |managername5|
            managername5.load_module('UPS-MIB')
            response5 = managername5.get(registersName5)
            response5.each_varbind do |vb|
              if method = typeValue[vb.value.asn1_type]
                paramsname_array5 = vb.value.send(method)
              else
                puts "Type '#{vb.value.asn1_type}' not recognized!"
              end
            end
          end

          SNMP::Manager.open(host: host, :community => @snmpdevice.community_type) do |managername6|
            managername6.load_module('UPS-MIB')
            response6 = managername6.get(registersName6)
            response6.each_varbind do |vb|
              if method = typeValue[vb.value.asn1_type]
                paramsname_array6 = vb.value.send(method)
              else
                puts "Type '#{vb.value.asn1_type}' not recognized!"
              end
            end
          end

          SNMP::Manager.open(host: host, :community => @snmpdevice.community_type) do |managername7|
            managername7.load_module('UPS-MIB')
            response7 = managername7.get(registersName7)
            response7.each_varbind do |vb|
              if method = typeValue[vb.value.asn1_type]
                paramsname_array7 = vb.value.send(method)
              else
                puts "Type '#{vb.value.asn1_type}' not recognized!"
              end
            end
          end

          SNMP::Manager.open(host: host, :community => @snmpdevice.community_type) do |managername8|
            managername8.load_module('UPS-MIB')
            response8 = managername8.get(registersName8)
            response8.each_varbind do |vb|
              if method = typeValue[vb.value.asn1_type]
                paramsname_array8 = vb.value.send(method)
              else
                puts "Type '#{vb.value.asn1_type}' not recognized!"
              end
            end
          end
          @oidName1 = pp paramsname_array1
          @oidName2 = pp paramsname_array2
          @oidName3 = pp paramsname_array3
          @oidName4 = pp paramsname_array4
          @oidName5 = pp paramsname_array5
          @oidName6 = pp paramsname_array6
          @oidName7 = pp paramsname_array7
          @oidName8 = pp paramsname_array8
        end
      else
        @status = 'Offline'
      end
    else
      redirect_to login_path
    end
  end

  # GET /snmpdevices/new
  def new
    if logged_in?
      @snmpdevice = Snmpdevice.new
    else
      redirect_to login_path
    end
  end

  # GET /snmpdevices/1/edit
  def edit
    if logged_in?
      @snmpdevice = Snmpdevice.find(params[:id])
    else
      redirect_to login_path
    end
  end

  # POST /snmpdevices or /snmpdevices.json
  def create
    @snmpdevice = Snmpdevice.new(snmpdevice_params)

    respond_to do |format|
      if @snmpdevice.save
        format.html { redirect_to snmpdevice_url(@snmpdevice), notice: "Snmpdevice was successfully created." }
        format.json { render :show, status: :created, location: @snmpdevice }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @snmpdevice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /snmpdevices/1 or /snmpdevices/1.json
  def update
    respond_to do |format|
      if @snmpdevice.update(snmpdevice_params)
        format.html { redirect_to snmpdevice_url(@snmpdevice), notice: "Snmpdevice was successfully updated." }
        format.json { render :show, status: :ok, location: @snmpdevice }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @snmpdevice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /snmpdevices/1 or /snmpdevices/1.json
  def destroy
    if logged_in?
      @snmpdevice.destroy

      respond_to do |format|
        format.html { redirect_to snmpdevices_url, notice: "Snmpdevice was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      redirect_to login_path
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_snmpdevice
      @snmpdevice = Snmpdevice.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def snmpdevice_params
      params.require(:snmpdevice).permit(:device_name, :device_ip, :community_type, :outlet_type, :oid_outletname1, :oid_outletname2, :oid_outletname3, :oid_outletname4, :oid_outletname5, :oid_outletname6, :oid_outletname7, :oid_outletname8, :oid_status1, :oid_status2, :oid_status3, :oid_status4, :oid_status5, :oid_status6, :oid_status7, :oid_status8)
    end
end
