class SelectsChangeAttribToField < ActiveRecord::Migration
  def change
	rename_column :selects, :attributeDisplayId, :fieldDisplayId
  end
end
