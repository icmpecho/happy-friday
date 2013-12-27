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
end
