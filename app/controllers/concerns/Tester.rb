module Tester
	#extend ActiveSupport::Concern
	def self.testing
		abort('tested')
	end
end