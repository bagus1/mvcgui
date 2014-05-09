class Attribute < ActiveRecord::Base
	belongs_to :model
	has_many :attribute_display


	scope :by_model, ->(modelid) { where(modelid: modelid) if modelid.present? }

	
end

