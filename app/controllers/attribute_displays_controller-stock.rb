class AttributeDisplaysController  < ApplicationController
  before_action :set_model, only: [:show, :edit, :update, :destroy]
  # GET /models
  # GET /models.json
  def index
    @attribute_displays = AttributeDisplay.all
  end

  def show
  end

  # GET /models/new
  def new
    @attribute_displays = Model.new
  end

  # GET /models/1/edit
  def edit
  end

  # POST /models
  # POST /models.json
  def create
    @attribute_display = AttributeDisplay.new(attribute_display_params)

    respond_to do |format|
      if @attribute_display.save
        format.html { redirect_to @attribute_display, notice: 'Attribute Display was successfully created.' }
        format.json { render action: 'show', status: :created, location: @attribute_display }
      else
        format.html { render action: 'new' }
        format.json { render json: @attribute_display.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /models/1
  # PATCH/PUT /models/1.json
  def update
    respond_to do |format|
      if @attribute_display.update(attribute_display_params)
        format.html { redirect_to @attribute_display, notice: 'attribute_display was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @attribute_display.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /models/1
  # DELETE /models/1.json
  def destroy
    @attribute_display.destroy
    respond_to do |format|
      format.html { redirect_to models_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attribute_display
      @attribute_display = AttributeDisplay.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attribute_display_params
#      params.require(:model).permit(:model:classname, :schema, :tablename, :name)
      params.permit(:attributeid, :format, :action, :header)

    end
end
