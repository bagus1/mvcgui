class CreateTextboxes < ActiveRecord::Migration
  def change
    create_table :textboxes do |t|
      t.integer :attributeDisplayId
      t.integer :size

      t.timestamps
    end
  end
end
