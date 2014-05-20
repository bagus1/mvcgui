class ModelDisplaysController < ApplicationController
  include MvcguiConcern
  layout  "mvcgui"
  helper_method :sort_column, :sort_direction, :is_displayable
  before_action :app_init
  before_action ->{ myinit 3 },  only: [:index, :show, :edit, :new]
  before_action :set_model_display, only: [:show, :edit, :update, :destroy]
  # GET /model_displays
  # GET /model_displays.json

  # GET /model_displays/1
  # GET /model_displays/1.json


  def show
  end

  # GET /model_displays/new
  def new
    @model_display = ModelDisplay.new
  end

  # GET /model_displays/1/edit
  def edit
  end

  # POST /model_displays
  # POST /model_displays.json
  def create
    @model_display = ModelDisplay.new(model_display_params)

    respond_to do |format|
      if @model_display.save
        format.html { redirect_to @model_display, notice: 'Model display was successfully created.' }
        format.json { render action: 'show', status: :created, location: @model_display }
      else
        format.html { render action: 'new' }
        format.json { render json: @model_display.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /model_displays/1
  # PATCH/PUT /model_displays/1.json
  def update
  	logger.info "tried to save it.. but..."
    respond_to do |format|
      if @model_display.update(model_display_params)
        format.html { redirect_to @model_display, notice: 'Model display was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @model_display.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /model_displays/1
  # DELETE /model_displays/1.json
  def destroy
    @model_display.destroy
    respond_to do |format|
      format.html { redirect_to model_displays_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model_display
      abort('i aborted')
      @model_display = ModelDisplay.find(params[:id])
      #testing
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def model_display_params
      params.require(:model_display).permit(:modelid, :format, :action, :header)
    end
end
