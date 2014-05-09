class Textbox < ActiveRecord::Base
	scope :by_attribute_display_id, ->(attribute_display_id) { where(attributedisplayid: attribute_display_id)}
end
