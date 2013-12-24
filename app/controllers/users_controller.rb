class UsersController < ApplicationController
	def index
		@users = User.all.desc(:weight)
		render json: @users
	end
end
