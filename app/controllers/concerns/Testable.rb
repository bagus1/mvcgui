module Testable
	extend ActiveSupport::Concern
	def testing
		abort('tested')
	end
end