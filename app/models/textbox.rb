class Textbox < ActiveRecord::Base
	scope :by_field_display_id, ->(field_display_id) { where(fielddisplayid: field_display_id)}
end
