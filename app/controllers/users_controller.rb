class UsersController < ApplicationController
	def index
		@users = User.all.asc(:weight)
		render json: @users, callback: params['callback']
	end
	def me
		@user = User.find(session[:user_id])
		render json: @user
	end
end
