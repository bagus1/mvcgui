class TextreadsController < ApplicationController
  before_action :set_textread, only: [:show, :edit, :update, :destroy]

  # GET /textreads
  # GET /textreads.json
  def index
    @textreads = Textread.all
  end

  # GET /textreads/1
  # GET /textreads/1.json
  def show
  end

  # GET /textreads/new
  def new
    @textread = Textread.new
  end

  # GET /textreads/1/edit
  def edit
  end

  # POST /textreads
  # POST /textreads.json
  def create
    @textread = Textread.new(textread_params)

    respond_to do |format|
      if @textread.save
        format.html { redirect_to @textread, notice: 'Textread was successfully created.' }
        format.json { render action: 'show', status: :created, location: @textread }
      else
        format.html { render action: 'new' }
        format.json { render json: @textread.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /textreads/1
  # PATCH/PUT /textreads/1.json
  def update
    respond_to do |format|
      if @textread.update(textread_params)
        format.html { redirect_to @textread, notice: 'Textread was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @textread.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /textreads/1
  # DELETE /textreads/1.json
  def destroy
    @textread.destroy
    respond_to do |format|
      format.html { redirect_to textreads_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_textread
      @textread = Textread.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def textread_params
      params.require(:textread).permit(:attributeDisplayId, :truncation, :truncation_format, :transformation)
    end
end
