class TextboxesController < ApplicationController
   include MvcguiConcern
  layout  "mvcgui"
  helper_method :sort_column, :sort_direction, :is_displayable
  before_action :app_init
  before_action ->{ myinit 6 },  only: [:index, :show, :edit, :new]
  #before_action :app_init,  only: [:index, :show, :edit, :new]
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def _params
      params.require(:textbox).permit(:fieldDisplayId, :size)
    end
end
