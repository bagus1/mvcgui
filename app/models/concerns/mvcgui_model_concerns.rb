module MvcguiModelConcern
	module ClassMethods
        def get_path(action = nil)
            action ||= params[:action]
            case action
            when 'index' 
               url_for(controller: params[:controller].to_s,
               action:  params[:action],
                only_path: true)
              when 'new' 
                url_for(self,
                action:  'create',
                only_path: true)
            when 'edit' 
                url_for(controller: params[:controller].to_s,
                action:  'update',
                only_path: true)
            else
                form_path = 'ack'
            end
        end
    end
end
