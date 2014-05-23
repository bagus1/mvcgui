module MvcguiConcern
    extend ActiveSupport::Concern

    # GET /models
    # GET /models.json
    def index
        #seems like you have to have an instance variable for the specific model because if you don't it doesn't pay attention to using your 'layout'
        #so we set one but then for convenience in the layout, we set @models equal to that.
        logger.info ("The instance variable is: @" + params[:controller].to_s)
        instance_variable_set("@" + params[:controller].to_s,  @the_class.order(sort_column + " " + sort_direction))
        #instance_variable_set("@" + params[:controller].to_s,  @the_class.all)
        @models = instance_variable_get("@" + params[:controller].to_s);
        #abort(@models.inspect)
    end
    def show
        instance_variable_set("@" + params[:controller].to_s.singularize,  @the_class.find(params[:id]))
        @models = []
        @models << instance_variable_get("@" + params[:controller].to_s.singularize);  
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

    def create
        @model = @the_class.new(_params)
        respond_to do |format|
          if @model.save
            format.html { redirect_to @model, notice: 'It was successfully created.' }
            format.json { render action: 'show', status: :created, location: @model }
          else
            format.html { render action: 'new' }
            format.json { render json: @model.errors, status: :unprocessable_entity }
          end
        end
    end
          # PATCH/PUT /models/1
      # PATCH/PUT /models/1.json
    def update
        set_the_display
        respond_to do |format|
          if @model.update(_params)
            logger.info "UUUUUUUUUU"
            format.html { redirect_to @model, notice: 'Thing was successfully updated.' }
            format.json { head :no_content }
          else
             logger.info "FffFFFFFFFF"
            format.html { render action: 'edit' }
            format.json { render json: @model.errors, status: :unprocessable_entity }
          end
        end
      end
    def destroy
        instance_variable_set("@" + params[:controller].to_s.singularize,  @the_class.find(params[:id]))
        @model = instance_variable_get("@" + params[:controller].to_s.singularize); 
        @model.destroy
        respond_to do |format|
            format.html { redirect_to models_url }
            format.json { head :no_content }
        end
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
        @model_properties = Model.find(mid)
        @fields =  Field.by_model(@modelid)
        unless @fields
          return redirect_to(:root, :notice => "There was no ModelDisplay for that action/format combo. Would you like to create one?")  
        end
        @field_ids = []
        @fields.each do |f|
          @field_ids << f.id
        end 
        logger.info 'field_ids    ' + @field_ids.inspect
        @field_disps = FieldDisplay.by_fields(@field_ids).by_action(params[:action])
        logger.info 'field_disps' + @field_disps.inspect
        @displayable_fields = []
        @field_disps.each do |field_disp|
          field = Field.find(field_disp.fieldid)
          if is_displayable?(field_disp.format)
            #lets figure out how to display it right here.
            logger.info "11111 " + field_disp.format.classify
            logger.info "22222 " + field_disp.id.inspect
            logger.info "33333 " + Textbox.by_field_display_id(7).last.inspect
            display_format = Object.const_get(field_disp.format.classify).by_field_display_id(field_disp.id).last #data_display models have to have this scope!
            logger.info "4444444444 "  + display_format.inspect
            @displayable_fields << {:field_display=>field_disp, :field=>field, :display_format=>display_format, :obj=>@model}
          end
        end
        logger.info "ddddddddc>>>>>>>>>>>>>>>>>>>>"  + @displayable_fields.to_s
        @modd_display = ModelDisplay.by_model(@modelid).by_action(params[:action]).last
        logger.info "ddddddddc>>>>>>>>>>>>>>>>>>>>"  + @modd_display.to_s
        
        unless @modd_display
          return redirect_to(new_model_display_path, :notice => "There was no ModelDisplay for that " + params[:action] +" action and " + @modelid.to_s + "modelid combo. Would you like to create one?")  
        end
        @record_format = RecordsFormat.find(@modd_display.format)
        #include GridHtml
        @app_format = Object.const_get(@record_format.name).new
        #@app_format = GridHtml.new  
        @form_path = get_path()
        @mvcgui = {
                :app_format=>@app_format, 
                :field_ids => @field_ids,
                :fields => @fields,
                :field_displays => @field_disps,
                :displayable_fields => @displayable_fields,
                :form_path =>@form_path,
                :modelid =>@modelid,
                :model_display => @modd_display, 
                :model_properties =>@model_properties,
                :record_format => @record_format
                 }
        #get_path?(Model)
       
        logger.info "mvc_gui rocks!!!!  " + @mvcgui.inspect
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
#        abort("sort sort sort sort" + @mvcgui[:model_properties][:default_sort_field])
      @the_class.column_names.include?(params[:sort]) ? params[:sort] :  @mvcgui[:model_properties][:default_sort_field]
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
