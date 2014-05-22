class FixTextboxAndTextreadFields < ActiveRecord::Migration
  def change
	rename_column :textboxes, :attributeDisplayId, :fieldDisplayId
	rename_column :textreads, :attributeDisplayId, :fieldDisplayId
  end
end
