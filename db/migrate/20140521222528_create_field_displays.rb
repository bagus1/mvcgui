class CreateFieldDisplays < ActiveRecord::Migration
  def change
    create_table :field_displays do |t|
      t.integer :attributeid
      t.string :format
      t.string :action
      t.string :header

      t.timestamps
    end
  end
end
