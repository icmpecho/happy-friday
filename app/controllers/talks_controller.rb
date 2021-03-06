class TalksController < ApplicationController
	skip_before_filter :verify_authenticity_token
	before_action :set_title
	before_action :set_me

	include DateHelper
	def index
		@talks = Talk.desc(:date)
		respond_to do |format|
			format.html
			format.json { render json: @talks, callback: params['callback'] }
		end
	end
	def create
		user = session[:user_id] ? User.find(session[:user_id]) : nil
		if( !user )
			flash[:error] = "Please log in to report talk."
			respond_to do |format|
				format.html { redirect_to talks_path }
				format.json { render json: false }
			end
			return
		end
		if( !user.talk? )
			flash[:error] = "You're not the one who should talk."
			respond_to do |format|
				format.html { redirect_to talks_path }
				format.json { render json: false }
			end
			return
		end
		if( !params['topic'] || params['topic'] == '' )
			flash[:error] = "Please specify your topic."
			respond_to do |format|
				format.html { redirect_to talks_path }
				format.json { render json: false }
			end
			return
		end
		talk = Talk.new(
			date: self.last_friday,
			topic: params['topic'],
			user: user
		)
		ret = talk.save
		if !ret
			flash[:error] = "Failed to report talk."
		else
			user.talked!
			flash[:success] = "Talk reported!"
		end
		respond_to do |format|
			format.html { redirect_to talks_path }
			format.json { render json: ret }
		end

	end

	private
		def set_title
			@title = 'Tech Talk'
		end
end
