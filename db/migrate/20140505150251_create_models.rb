class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :classname
      t.string :schema
      t.string :tablename
      t.string :name

      t.timestamps
    end
  end
end
