class FieldDisplay < ActiveRecord::Base
belongs_to :field
	scope :by_fields, ->(fields) { where(fieldid: fields) }
	scope :by_action, ->(action) { where(action: action) }
end
