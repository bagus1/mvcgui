class Model < ActiveRecord::Base
	include MvcguiModelConcern
	attr_accessor :modelid
  

  def tester(action = nil)
  	abort('beep')
    logger.info ("NEW PATHJ "  + self.get_path('new'))
  end


	#has_many :attributes #ack you can't do this!  http://reservedwords.herokuapp.com/words/attributes
	attr_writer :modelid
	scope :by_model, ->(modelid) { where(id: modelid) if modelid.present? }
	#after_initialize :set_modelid

	def set_modelid
		@modelid = 1
		logger.info 'asasasasasaasas' + self.inspect
	end
end
