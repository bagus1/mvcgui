class Model < ActiveRecord::Base
	include MvcguiModelConcern
	after_create  :make_model_displays#, :only => [:create] #add update.
	
	#has_many :attributes #ack you can't do this!  http://reservedwords.herokuapp.com/words/attributes
	attr_accessor :modelid
	attr_writer :modelid
	scope :by_model, ->(modelid) { where(id: modelid) if modelid.present? }
	def make_model_displays 
		logger.info "sufufufuffuuffufuf ooo " + self.inspect
		actions = []
		actions << {:format=>2, :action=>'new', :header=>'Create ' + self.name}
		actions << {:format=>2, :action=>'edit', :header=>'Edit ' + self.name}
		actions << {:format=>1, :action=>'index', :header=>self.name.pluralize}
		actions << {:format=>2, :action=>'show', :header=>'Show' + self.name}
		logger.info "actions to string " + actions.to_s
 		actions.each do | action |
 		  ModelDisplay.create(:modelid=>self.id, :format=>action[:format], :action=>action[:action], :header=>action[:header])
 		end
	end

end


#<Model id: 12, classname: nil, schema: "sqlite", tablename: "testers", name: "Tester", created_at: "2014-05-23 20:32:46", updated_at: "2014-05-23 20:32:46", default_sort_field: "id">