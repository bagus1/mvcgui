class FieldsController < ApplicationController
	include MvcguiConcern
 	layout  "mvcgui"
 	helper_method :sort_column, :sort_direction, :is_displayable
 	before_action :app_init
 	before_action ->{ myinit 2 },  only: [:index, :show, :edit, :new]
 	private
    	# Never trust parameters from the scary internet, only allow the white list through.
    	def _params
    		params.require(:field).permit(:modelid, :schema, :tablename, :field, :default_value)
    	end
end
