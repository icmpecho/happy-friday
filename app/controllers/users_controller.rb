class UsersController < ApplicationController
	skip_before_filter :verify_authenticity_token
	def index
		@title = 'Users'
		@users = User.all.asc(:weight)
		my_id = session[:user_id]
		@me = my_id ? User.find(my_id) : nil
		respond_to do |format|
			format.html
			format.json { render json: @users, callback: params['callback'] }
		end
	end
	def me
		@title = 'Me'
		@me = session[:user_id] ? User.find(session[:user_id]) : nil
		respond_to do |format|
			format.html
			format.json { render json: @me, callback: params['callback'] }
		end
	end
	def update_me
		@user = session[:user_id] ? User.find(session[:user_id]) : nil
		if(!@user)
			flash[:error] = "Please log in to update your profile."
			respond_to do |format|
				format.html { redirect_to users_path }
				format.json { render json: false }
			end
			return
		end
		nickname = params[:nickname].blank? ? @user.nickname : params[:nickname]
		team = params[:team].blank? ? @user.team : params[:team]
		@user.team = team
		@user.nickname = nickname
		ret = @user.save
		if ret
			flash[:success] = "Success!"
		else
			flash[:error] = "Can't update profile"
		end
		respond_to do |format|
			format.html { redirect_to me_path }
			format.json { render json: ret }
		end
	end
	def volunteer
		@user = session[:user_id] ? User.find(session[:user_id]) : nil
		if(!@user)
			flash[:error] = "Please log in to volunteer."
			respond_to do |format|
				format.html { redirect_to users_path }
				format.json { render json: false }
			end
			return
		end
		weeks = params[:weeks] || 0
		ret = @user.volunteer!(weeks)
		if(ret)
			flash[:success] = "Success!"
		else
			flash[:error] = "You can't volunteer like that!"
		end
		respond_to do |format|
			format.html { redirect_to users_path }
			format.json { render json: ret }
		end
	end
end
