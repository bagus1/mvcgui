module MvcguiConcern
    extend ActiveSupport::Concern

    # GET /models
    # GET /models.json
    def index
        #seems like you have to have an instance variable for the specific model because if you don't it doesn't pay attention to using your 'layout'
        #so we set one but then for convenience in the layout, we set @models equal to that.

        #sorting!
        #instance_variable_set("@" + params[:controller].to_s,  @the_class.order(sort_column + " " + sort_direction))
        
        instance_variable_set("@" + params[:controller].to_s,  @the_class.all)
        @models = instance_variable_get("@" + params[:controller].to_s);
    end

    def new
        #abort("@" + params[:controller].to_s)
        instance_variable_set("@" + params[:controller].to_s.singularize,  @the_class.new)
        @model = instance_variable_get("@" + params[:controller].to_s.singularize);  
    end

    def edit
        #abort("@" + params[:controller].to_s)
        instance_variable_set("@" + params[:controller].to_s.singularize,  @the_class.find(params[:id]))
        @model = instance_variable_get("@" + params[:controller].to_s.singularize);  
    end
    def set_the_display
        instance_variable_set("@" + params[:controller].to_s,  @the_class.find(params[:id]))
        @model = instance_variable_get("@" + params[:controller].to_s);
    end

    def testing
        logger.info 'tested it'
        #abort('tested it i did')
    end

    def app_init
        #the crazyness starts right here.
        @the_class = params[:controller].to_s.classify.constantize
    end

    def myinit(mid)
        logger.info "boooter " +self.get_path
        @modelid = mid
        @attributes =  Attribute.by_model(@modelid)
        unless @attributes
          return redirect_to(new_attribute_display_path, :notice => "There was no ModelDisplay for that action/format combo. Would you like to create one?")  
        end
        @attribute_ids = []
        @attributes.each do |att|
          @attribute_ids << att.id
        end 
        logger.info 'attr_ ids    ' + @attribute_ids.inspect
        @attr_displays = AttributeDisplay.by_attribs(@attribute_ids).by_action(params[:action])
        logger.info 'attr_displays' + @attr_displays.inspect
        @displayable_attributes = []
        @attr_displays.each do |attr_display|
          attribute = Attribute.find(attr_display.attributeid)
          if is_displayable?(attr_display.format)
            #lets figure out how to display it right here.
            logger.info "11111 " + attr_display.format.classify
            logger.info "22222 " + attr_display.id.inspect
            logger.info "33333 " + Textbox.by_attribute_display_id(7).last.inspect
            display_format = Object.const_get(attr_display.format.classify).by_attribute_display_id(attr_display.id).last
            logger.info "4444444444 "  + display_format.inspect
            @displayable_attributes << {:attr_display=>attr_display, :attribute=>attribute, :display_format=>display_format, :obj=>@model}
          end
        end
        logger.info "ddddddddc>>>>>>>>>>>>>>>>>>>>"  + @displayable_attributes.to_s
        @modd_display = ModelDisplay.by_model(@modelid).by_action(params[:action]).last
        unless @modd_display
          return redirect_to(new_model_display_path, :notice => "There was no ModelDisplay for that action/format combo. Would you like to create one?")  
        end
        @record_format = RecordsFormat.find(@modd_display.format)
        #include GridHtml
        @app_format = Object.const_get(@record_format.name).new
        #@app_format = GridHtml.new  
        @form_path = get_path()
        @mvcgui = {:model_display => @modd_display, :record_format => @record_format, :app_format=>@app_format }
        #get_path?(Model)
       
        #logger.info "iididididididididdidi " + @form_path
    end

    def get_path
        #abort (' params[:controller].to_s ' +  params[:controller].to_s)
      case params[:action]
      when 'index' 
        url_for(controller: params[:controller].to_s,
        action:  params[:action],
        only_path: true)
      when 'new' 
        url_for(controller: params[:controller].to_s,
        action:  'create',
        only_path: true)
      when 'edit' 
        url_for(controller: params[:controller].to_s,
        action:  'update',
        only_path: true)
      else
       form_path = 'ack'
      end
    end 

    def sort_column
      @the_class.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
    end

    def is_displayable?(format)
      if format == 'hidden' || format == 'off'
        false
      else
      logger.info "is_displayable" + format
        true
      end
    end
end
