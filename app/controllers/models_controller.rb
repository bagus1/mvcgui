class ModelsController < ApplicationController
  helper_method :sort_column, :sort_direction, :is_displayable
  before_action :get_attributes
  before_action :set_model, only: [:show, :edit, :update, :destroy]
  layout  "mvcgui"
  def get_attributes
    @modelid = 1
    @attributes =  Attribute.by_model(@modelid)
    @attribute_ids = []
    @attributes.each do |att|
      @attribute_ids << att.id
    end 
    @attr_displays = AttributeDisplay.by_attribs(@attribute_ids).by_action(params[:action])
    #logger.info 'attr_displays' + @attr_displays.inspect
    @displayable_attributes = []
    @attr_displays.each do |attr_display|
      attribute = Attribute.find(attr_display.attributeid)
      if is_displayable?(attr_display.format)
        #lets figure out how to display it right here.
        display_format = attr_display.format
        display_format = Object.const_get(attr_display.format.classify).by_attribute_display_id(attr_display.id).last
        @displayable_attributes << {:attr_display=>attr_display, :attribute=>attribute, :display_format_obj=>display_format}
      end
    end
    logger.info "da>>>>>>>>>>>>>>>>>>>>>"  + @displayable_attributes.to_s

    @modd_display = ModelDisplay.by_model(@modelid).by_action(params[:action]).last

    unless @modd_display
      return redirect_to(new_model_display_path, :notice => "There was no ModelDisplay for that action/format combo. Would you like to create one?")  
    end
 
    @record_format = RecordsFormat.find(@modd_display.format)
    #include GridHtml
    @app_format = Object.const_get(@record_format.name).new

    #@app_format = GridHtml.new  

  end
  # GET /models
  # GET /models.json
  def index
    @models = Model.order(sort_column + ' ' + sort_direction)
  end

  # GET /models/1
  # GET /models/1.json
  def show
  end

  # GET /models/new
  def new
    @model = Model.new
  end

  # GET /models/1/edit
  def edit
    @models = Model.by_model(params[:id])
  end

  # POST /models
  # POST /models.json
  def create
    @model = Model.new(model_params)

    respond_to do |format|
      if @model.save
        format.html { redirect_to @model, notice: 'Model was successfully created.' }
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
    respond_to do |format|
      if @model.update(model_params)
        format.html { redirect_to @model, notice: 'Model was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /models/1
  # DELETE /models/1.json
  def destroy
    @model.destroy
    respond_to do |format|
      format.html { redirect_to models_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model
      @model = Model.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def model_params
#      params.require(:model).permit(:model:classname, :schema, :tablename, :name)
      params.permit(:model, :classname, :schema, :tablename, :name)
    end

    def sort_column
      Model.column_names.include?(params[:sort]) ? params[:sort] : "name"
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
