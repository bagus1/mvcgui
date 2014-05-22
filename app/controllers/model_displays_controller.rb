class ModelDisplaysController < ApplicationController
  include MvcguiConcern
  layout  "mvcgui"
  helper_method :sort_column
  helper_method :sort_direction, :is_displayable
  before_action :app_init
  before_action ->{ myinit 3 },  only: [:index, :show, :edit, :new]


  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def _params
      params.require(:model_display).permit(:modelid, :format, :action, :header)
    end
end
