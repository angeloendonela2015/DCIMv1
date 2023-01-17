class CreateDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :devices do |t|
      t.string :unitname
      t.string :ipaddress
      t.string :sensore_type
      t.string :community
      t.string :oid
      t.string :alarm

      t.timestamps
    end
  end
end
