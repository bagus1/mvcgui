class TestersController < ApplicationController
  include MvcguiConcern
  layout  "mvcgui"
  helper_method :sort_column, :sort_direction, :is_displayable
  before_action :app_init
  before_action ->{ myinit 12 },  only: [:index, :show, :edit, :new]


  private 
    def _params
      params.require(:tester).permit(:one, :two, :three, :four)
    end
end