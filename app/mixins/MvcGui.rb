class MvcGui 
	def mvcgui_model_displays
      @model_displays =  ModelDisplay.where('modelid = 1')
    end
	def mvcgui_attributes
      @attributes =  Attribute.where('modelid = 1')# + @modelid);
    end
	def mvcgui_attribute_displays
      @attribute_displays =  AttributeDisplay.where('attributeId = 1')
      @attribute_displays = params[:action]
      @attribute_displays = 'x'
    end
end
