class ModelsController < ApplicationController
  include MvcguiConcern
  layout  "mvcgui"
  helper_method :sort_column, :sort_direction, :is_displayable
  before_action :app_init
  before_action ->{ myinit 1 },  only: [:index, :show, :edit, :new]
  before_action :set_model, only: [:show, :edit, :update, :destroy]
  #before_action :app_init,  only: [:index, :show, :edit, :new]

  # GET /models/1
  # GET /models/1.json
  def show
  end

  # GET /models/new
  # GET /models/1/edit
  def edit
    @models = @the_class.by_model(params[:id])
  end

  # POST /models
  # POST /models.json
  def create
    @model = @the_class.new(model_params)
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
      @model = @the_class.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def model_params
      #      params.require(:model).permit(:model:classname, :schema, :tablename, :name)
      params.require(:model).permit(:classname, :schema, :tablename, :name, :default_sort_field)
    end

end
