class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	#before_action :get_model_displays, only: [:show, :index, :edit, :new, :delete]  	
 	#before_action :get_attribute_displays, only: [:show, :index, :edit, :new, :delete]

 	logger.info "Processing baz request..."


	def get_model_displayss
		#@model_displays =  ModelDisplay.where('modelid = 1')
	end

	def get_attribute_displayss
	#	@attribute_displays =  AttributeDisplay.where('attributeId = 1')
#		@attribute_displays = params[:action]
# 		@attribute_displays = 'x'
    end
end
