class CreateDisplays < ActiveRecord::Migration[5.2]
  def change
    create_table :displays do |t|
      t.string :title
      t.string :subtitle
      t.string :logo
      t.string :bckimage
      t.string :backcolor

      t.timestamps
    end
  end
end
