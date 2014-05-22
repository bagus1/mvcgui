class TextreadsController < ApplicationController
  include MvcguiConcern
  layout  "mvcgui"
  helper_method :sort_column, :sort_direction, :is_displayable
  before_action :app_init
  before_action ->{ myinit 2 },  only: [:index, :show, :edit, :new]


  private 
    def _params
      params.require(:textread).permit(:fieldDisplayId, :truncation, :truncation_format, :transformation)
    end
end
