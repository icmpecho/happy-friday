class UsersController < ApplicationController
	skip_before_filter :verify_authenticity_token
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
	def volunteer
		@user = session[:user_id] ? User.find(session[:user_id]) : nil
		if(!@user)
			respond_to do |format|
				format.html { redirect_to users_path }
				format.json { render json: false }
			end
			return
		end
		weeks = params[:weeks] || 0
		ret = @user.volunteer!(weeks)
		respond_to do |format|
			format.html { redirect_to users_path }
			format.json { render json: ret }
		end
	end
end
