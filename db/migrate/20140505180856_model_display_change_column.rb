class ModelDisplayChangeColumn < ActiveRecord::Migration
  def change
    rename_column :model_displays, :pageformat, :format
    rename_column :model_displays, :pagefunction, :action

  end
end
