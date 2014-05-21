module ApplicationHelper
#this probably needs to go in an mvcgui specific helper.

	def sortable(column, title=nil)
		title ||= column.titleize
		css_class = column == sort_column ? "current #{sort_direction}" : nil
		direction = column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
		link_to title, {:sort => column, :direction => direction}, class: css_class
	end

  def get_path(action = nil, id = nil)
  	
        action ||= params[:action]
  	#abort(action + "..." + id)
  	          case action
            when 'index' #untested
               url_for(controller: params[:controller].to_s,
               action:  params[:action],
                only_path: true)
             when 'new' 
                url_for(controller: params[:controller].to_s,
                action:  'new',
                only_path: true)
            when 'edit'  #untested
                url_for(controller: params[:controller].to_s,
                action:  'edit',
                :id=>id,#catch errors
                only_path: true)
            when 'show'  #untested
                url_for(controller: params[:controller].to_s,
                :id => id,
                action:  'show',
                only_path: true
                )
            else
                form_path = 'ack'
            end
  end
end
