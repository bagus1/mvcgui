class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.integer :modelid
      t.string :schema
      t.string :tablename
      t.string :field

      t.timestamps
    end
  end
end
