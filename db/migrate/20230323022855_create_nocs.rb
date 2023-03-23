class CreateNocs < ActiveRecord::Migration[5.2]
  def change
    create_table :nocs do |t|
      t.string :sensorename
      t.string :oid
      t.string :ipname
      t.string :ipaddress

      t.timestamps
    end
  end
end
