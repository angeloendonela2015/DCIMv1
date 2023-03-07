class CreateSnmpdevices < ActiveRecord::Migration[5.2]
  def change
    create_table :snmpdevices do |t|
      t.string :device_name
      t.string :device_ip
      t.string :community_type
      t.string :outlet_type
      t.string :oid_outletname1
      t.string :oid_outletname2
      t.string :oid_outletname3
      t.string :oid_outletname4
      t.string :oid_outletname5
      t.string :oid_outletname6
      t.string :oid_outletname7
      t.string :oid_outletname8
      t.string :oid_status1
      t.string :oid_status2
      t.string :oid_status3
      t.string :oid_status4
      t.string :oid_status5
      t.string :oid_status6
      t.string :oid_status7
      t.string :oid_status8

      t.timestamps
    end
  end
end
