class ModelDisplay < ActiveRecord::Base
	belongs_to :models
	scope :by_model, ->(modelid) { where(modelid: modelid) if modelid.present? }
	scope :by_action, ->(action) { where(action: action) if action.present? }

end
