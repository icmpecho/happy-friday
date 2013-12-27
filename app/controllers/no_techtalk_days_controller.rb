class NoTechtalkDaysController < ApplicationController
	skip_before_filter :verify_authenticity_token
	def index
		@title = 'Skips'
		@days = NoTechtalkDay.desc(:date)
		@me = session[:user_id] ? User.find(session[:user_id]) : nil
		respond_to do |format|
			format.html
			format.json { render json: @days, callback: params['callback'] }
		end
	end

	def create
		user = session[:user_id] ? User.find(session[:user_id]) : nil
		if(!user)
			flash[:error] = "Please log in to report skip."
			respond_to do |format|
				format.html { redirect_to users_path }
				format.json { render json: false }
			end
			return
		end
		skip_date = params[:date]
		if(!skip_date || skip_date.empty?)
			flash[:error] = "No date specified."
			respond_to do |format|
				format.html { redirect_to users_path }
				format.json { render json: false }
			end
			return
		end
		if(!params[:reason] || params[:reason].empty?)
			flash[:error] = "Please specify a reason."
			respond_to do |format|
				format.html { redirect_to users_path }
				format.json { render json: false }
			end
			return
		end
		day = NoTechtalkDay.new(
			date: skip_date,
			reason: params['reason'],
			reporter: user
		)
		ret = day.save
		if !ret
			flash[:error] = "Failed to skip talk."
		else
			flash[:success] = "Skip reported!"
		end
		respond_to do |format|
			format.html { redirect_to no_techtalk_days_path }
			format.json { render json: ret }
		end
	end

end
