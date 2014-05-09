class CreateAttributes < ActiveRecord::Migration
  def change
    create_table :attributes do |t|
      t.integer :modelid
      t.string :schema
      t.string :tablename
      t.string :field

      t.timestamps
    end
  end
end
