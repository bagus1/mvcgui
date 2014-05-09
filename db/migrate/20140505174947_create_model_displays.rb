class CreateModelDisplays < ActiveRecord::Migration
  def change
    create_table :model_displays do |t|
      t.integer :modelid
      t.string :pageformat
      t.string :pagefunction
      t.string :header

      t.timestamps
    end
  end
end
