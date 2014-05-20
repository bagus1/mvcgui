class Model < ActiveRecord::Base
	include MvcguiModelConcern
	#has_many :attributes #ack you can't do this!  http://reservedwords.herokuapp.com/words/attributes
	attr_accessor :modelid
	attr_writer :modelid
	scope :by_model, ->(modelid) { where(id: modelid) if modelid.present? }
end
