class UsersController < ApplicationController
	def index
		@users = User.all.asc(:weight)
		render json: @users, callback: params['callback']
	end
end
