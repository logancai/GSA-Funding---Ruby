require 'application_type'
class FrontController < ApplicationController
  layout "application_without"
  def index
  	@application_types = ApplicationType.all
  end
end
