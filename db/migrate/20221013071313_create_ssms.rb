class CreateSsms < ActiveRecord::Migration[5.2]
  def change
    create_table :ssms do |t|
      t.string :unitname
      t.string :ipaddress

      t.timestamps
    end
  end
end
