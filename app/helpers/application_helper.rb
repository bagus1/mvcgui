module ApplicationHelper

  def get_path(action = nil, id = nil)
  	#this probably needs to go in an mvcgui specific helper.

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
                :id=>id,
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
