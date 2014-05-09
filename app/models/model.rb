class Model < ActiveRecord::Base
	has_many :attributes
	attr_writer :modelid
	scope :by_model, ->(modelid) { where(id: modelid) if modelid.present? }
	
end
