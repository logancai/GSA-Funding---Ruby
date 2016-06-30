class ApplicationsController < ApplicationController
  include ApplicationHelper
  require 'boxr'
  require 'openssl'
  def index
  end
  def box
 	# items = box_user_token
 	client = Boxr::Client.new(box_user_token)
 	items = client.folder_from_id(ENV["BOX_SITE_ROOT_FOLDER_ID"])
 	@return_message = items
 	# @return_messageBoxr::create_user("logan.cai@gmail.com", "Logan Cai", phone: nil, address: nil, space_amount: nil, tracking_codes: nil,can_see_managed_users: nil, is_external_collab_restricted: nil, status: nil, timezone: nil, is_exempt_from_device_limits: nil, is_exempt_from_login_verification: nil)

 	# @return_message = client.create_user("logan.cai@gmail.com", "Logan Cai", phone: nil, address: nil, space_amount: nil, tracking_codes: nil,can_see_managed_users: nil, is_external_collab_restricted: nil, status: nil, timezone: nil, is_exempt_from_device_limits: nil, is_exempt_from_login_verification: nil)
  	render("index")
  end
  # token_refresh_callback = lambda {|access, refresh, identifier| some_method_that_saves_them(access, refresh)}
end
