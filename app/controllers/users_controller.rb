class UsersController < ApplicationController
	def index
		@users = User.all.asc(:weight)
		render json: @users, callback: params['callback']
	end
	def me
		@user = session[:user_id] ? User.find(session[:user_id]) : nil
		render json: @user
	end
end
