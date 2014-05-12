module ModelsHelper
	def sortable(column, title=nil)
		title ||= column.titleize
		css_class = column == sort_column ? "current #{sort_direction}" : nil
		direction = column == sort_column && sort_direction == 'asc' ? 'desc' :'asc'
		link_to title, {:sort => column, :direction => direction}, class: css_class
	end

    def form_or_form_for object
     if ['edit','new'].include?(params[:action])
       form_for(object)
      else
       form_tag('/go')
      end
    end
end
