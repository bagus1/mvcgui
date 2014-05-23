class SelectsController < ApplicationController
  include MvcguiConcern
  layout  "mvcgui"
  helper_method :sort_column, :sort_direction, :is_displayable
  before_action :app_init
  before_action ->{ myinit 8 },  only: [:index, :show, :edit, :new]

  private 
    def _params
      params.require(:textread).permit(:fieldDisplayId, :model, :field, :collection, :value_method, :text_method, :data_size, :include_blank)
    end

end
