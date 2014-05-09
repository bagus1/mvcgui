class AttributeDisplay < ActiveRecord::Base
	belongs_to :attribute
	#attr_accessible :attributeid, :format, :action, :header, :created_at, :updated_at
	scope :by_attribs, ->(attribs) { where(attributeid: attribs) }
	scope :by_action, ->(action) { where(action: action) }
end
