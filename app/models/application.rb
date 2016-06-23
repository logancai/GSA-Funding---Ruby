class Application < ActiveRecord::Base
	belongs_to :user
	has_one :application_type
	has_many :uploads
	has_many :comments
	has_one :status

	scope :sorted, lambda {order("applications.updated_at DESC")}
end
