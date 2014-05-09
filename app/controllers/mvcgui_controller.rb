class MvcGuiController < ApplicationController
	before_action :get_attributes
	def get_attributes
      @attributes =  Attribute.where('modelid = 1');
    end
end
