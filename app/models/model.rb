class Model < ActiveRecord::Base
	attr_accessor :modelid

	has_many :attributes
	attr_writer :modelid
	scope :by_model, ->(modelid) { where(id: modelid) if modelid.present? }
	#after_initialize :set_modelid

	def set_modelid
		@modelid = 1
		logger.info 'asasasasasaasas' + self.inspect
	end
end
