class FixFielddisplayAttrib < ActiveRecord::Migration
  def change
	rename_column :field_displays, :attributeid, :fieldid
  end
end
