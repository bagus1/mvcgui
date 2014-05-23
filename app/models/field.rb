class Field < ActiveRecord::Base
	belongs_to :model
	has_many :field_display
	after_create  :make_field_displays #, :only => [:create] #add update.
	#after_create :make_migration 
	scope :by_model, ->(modelid) { where(modelid: modelid) if modelid.present? }

	def make_field_displays 
		modd_displays = ModelDisplay.by_model(self.modelid)
		preps = []
		modd_displays.each do | modd_display | 
			format = ['index', 'show'].include?(modd_display.action) ?  'textread' : 'textbox'
			FieldDisplay.create(:action=>modd_display.action, :fieldid=>self.id, :format=>format, :header=>self.field)
		end
 		
	end

end
