class ApplicationType < ActiveRecord::Base
	belongs_to :application
	has_many :application_modules
	has_many :application_directors
end
