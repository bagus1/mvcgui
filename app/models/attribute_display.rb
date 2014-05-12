class AttributeDisplay < ActiveRecord::Base
	belongs_to :attribute
	#attr_accessor :attributeid, :format, :action, :header, :created_at, :updated_at, :attribute_id
	scope :by_attribs, ->(attribs) { where(attributeid: attribs) }
	scope :by_action, ->(action) { where(action: action) }
end
