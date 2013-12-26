class UsersController < ApplicationController
	def index
		@users = User.all.asc(:weight)
		my_id = session[:user_id]
		@me = my_id ? User.find(my_id) : nil
		respond_to do |format|
			format.html
			format.json { render json: @users, callback: params['callback'] }
		end
	end
	def me
		@user = session[:user_id] ? User.find(session[:user_id]) : nil
		render json: @user
	end
end
