class SessionsController < ApplicationController
	def create
		auth = request.env["omniauth.auth"]
  	user = User.where(:provider => auth['provider'],
    	:uid => auth['uid']).first || User.create_with_omniauth(auth)
  	session[:user_id] = user.id
  	redirect_to users_path
	end

	def new
		redirect_to '/auth/google_oauth2'
	end

	def destroy
		reset_session
		redirect_to users_path
	end
	
end
