class ApplicationType < ActiveRecord::Base
	belongs_to :application
	has_many :application_modules
	has_many :application_directors
	has_many :application_flows

	scope :sorted, lambda {order("application_type.full_name ASC")}
end
