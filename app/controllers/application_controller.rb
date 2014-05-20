class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	#before_action :get_model_displays, only: [:show, :index, :edit, :new, :delete]  	
 	#before_action :get_attribute_displays, only: [:show, :index, :edit, :new, :delete]

	def app_init1
	    @the_class = params[:controller].to_s.classify.constantize
	end

    def app_init(modelid)
    	@attributes =  Attribute.by_model(@modelid)
		unless @attributes
      		return redirect_to(new_attribute_display_path, :notice => "There was no ModelDisplay for that action/format combo. Would you like to create one?")  
    	end
 		@attribute_ids = []
		@attributes.each do |att|
       		@attribute_ids << att.id
    	end 
    	@attr_displays = AttributeDisplay.by_attribs(@attribute_ids).by_action(params[:action])
    	#logger.info 'attr_displays' + @attr_displays.inspect
    	@displayable_attributes = []

 	end
	def get_model_displayss
		#@model_displays =  ModelDisplay.where('modelid = 1')
	end

	def get_attribute_displayss
	#	@attribute_displays =  AttributeDisplay.where('attributeId = 1')
#		@attribute_displays = params[:action]
# 		@attribute_displays = 'x'
    end
end
