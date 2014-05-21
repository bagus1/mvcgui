class AddDefaultSortFieldToModels < ActiveRecord::Migration
  def change
    add_column :models, :default_sort_field, :string
  end
end
