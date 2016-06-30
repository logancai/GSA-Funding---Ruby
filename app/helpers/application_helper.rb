module ApplicationHelper
	require 'boxr'

	def get_file_as_string(filename)
	  data = ''
	  f = File.open(filename, "r") 
	  f.each_line do |line|
	    data += line
	  end
	  return data
	end
	def box_enterprise_token
		if session[:access_enterprise_token].nil? || session[:access_enterprise_token].empty?
			private_key = OpenSSL::PKey::RSA.new(File.read(ENV['JWT_PRIVATE_KEY_PATH']), ENV['JWT_PRIVATE_KEY_PASSWORD'])
			#make sure ENV['BOX_ENTERPRISE_ID'], ENV['BOX_CLIENT_ID'] and ENV['BOX_CLIENT_SECRET'] are set
			# response = Boxr::get_enterprise_token(private_key: private_key)
			response = Boxr::get_enterprise_token(private_key: private_key, private_key_password: ENV['JWT_PRIVATE_KEY_PASSWORD'], public_key_id: ENV['JWT_PUBLIC_KEY_ID'], enterprise_id: ENV['BOX_ENTERPRISE_ID'], client_id: ENV['BOX_CLIENT_ID'], client_secret: ENV['BOX_CLIENT_SECRET'])
			session[:access_enterprise_token_expire] = Time.now.to_i + response.expires_in.to_i
			session[:access_enterprise_token] = response.access_token
			return response.access_token
		else
			if session[:access_enterprise_token_expire]<Time.now.to_i #expired
				session[:access_enterprise_token] = nil
				session[:access_enterprise_token_expire] = nil
				box_enterprise_token
			else #not expired
				return session[:access_enterprise_token]
			end
		end
	end
	def box_user_token
		if session[:access_user_token].nil? || session[:access_user_token].empty?
			private_key = OpenSSL::PKey::RSA.new(File.read(ENV['JWT_PRIVATE_KEY_PATH']), ENV['JWT_PRIVATE_KEY_PASSWORD'])
			#make sure ENV['BOX_ENTERPRISE_ID'], ENV['BOX_CLIENT_ID'] and ENV['BOX_CLIENT_SECRET'] are set			
			response = Boxr::get_user_token(ENV['BOX_SYSTEM_USER_ID'], private_key: private_key, private_key_password: ENV['JWT_PRIVATE_KEY_PASSWORD'], public_key_id: ENV['JWT_PUBLIC_KEY_ID'], client_id: ENV['BOX_CLIENT_ID'], client_secret: ENV['BOX_CLIENT_SECRET'])
			session[:access_user_token_expire] = Time.now.to_i + response.expires_in.to_i
			session[:access_user_token] = response.access_token
			return response.access_token
		else
			if session[:access_user_token_expire]<Time.now.to_i #expired
				session[:access_user_token] = nil
				session[:access_user_token_expire] = nil
				box_user_token
			else #not expired
				return session[:access_user_token]
			end
		end
	end
end
