class FieldDisplay < ActiveRecord::Base
	after_save  :make_data_display
	belongs_to :field
	scope :by_fields, ->(fields) { where(fieldid: fields) }
	scope :by_action, ->(action) { where(action: action) }

	def make_data_display 
 		data_display_class = self.format.to_s.classify.constantize
 		data_display_obj = data_display_class.new
 		model_id = data_display_obj.get_model_id
        logger.info "can u type" +  model_id.to_s + "..." + self.format.to_s.classify
        logger.info data_display_class.inspect
        fields = Field.by_model(model_id)
        logger.info "fields inspect" + fields.inspect
        fields_defaults = {:fieldDisplayId => self.id}
   
        logger.info "fields_defaults_ini " + fields_defaults.inspect
        fields.each do |field| 
        	logger.info "field dooooo" + field.inspect
        	unless field.default_value.nil?
             	logger.info "field done" + field.inspect    		
				fields_defaults[field.field.parameterize.underscore.to_sym] = field.default_value
			end
        end
        logger.info "fields_defaults" + fields_defaults.inspect
        logger.info "burrrrrrrp"  
#GroupMember.where(:member_id => 4, :group_id => 7).first_or_create { |gm| gm.name = "John Doe" }
      	logger.info (data_display_class.where(:fieldDisplayId => self.id).inspect)
        data_display_class.where(:fieldDisplayId => self.id).first_or_create(fields_defaults)

        #data_display_class.create(fields_defaults)
        logger.info "boooop"

	end
end
