module ActiveRecordExtension
  extend ActiveSupport::Concern
  # add your instance methods here
#  def foo
#     "foo"
#  end
#  def eat_banana
#    logger.info("ate a banana")
#  end
  # add your static(class) methods here
#  module ClassMethods
#    def bar
#      "bar"
#    end

#  end
end
# include the extension 
ActiveRecord::Base.send(:include, ActiveRecordExtension)