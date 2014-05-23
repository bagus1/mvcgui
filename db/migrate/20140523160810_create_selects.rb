class CreateSelects < ActiveRecord::Migration
  def change
    create_table :selects do |t|
      t.integer :attributeDisplayId
      t.integer :model
      t.integer :field
      t.string :collection
      t.string :value_method
      t.string :text_method
      t.integer :data_size
      t.string :include_blank

      t.timestamps
    end
  end
end
