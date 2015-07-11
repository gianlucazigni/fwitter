require_relative "../../config/environment.rb"
require_relative "../models/fweet.rb"
require_relative "../models/user.rb"
require "pry"
require "sinatra/base"
require "sinatra/flash"


class ApplicationController < Sinatra::Base

register Sinatra::Flash

	configure do
		set :public_folder, 'public'
		set :views, 'app/views'
		set :sessions, true
		set :session_secret, "/plz_dnt_hrt_mh"
	end

	get '/login' do
		if logged_in?
			redirect '/'
		else
			erb :login
		end
	end

	post '/login' do
		@user = User.find_by(username: params[:username])
		if @user
			session[:user_id] = @user.id
			redirect '/'
		else
			flash[:error] = "That is not a valid username."
			redirect '/login'
		end	
	end

	get "/" do
		if logged_in?
			@users = User.all
			@fweets = Fweet.all
			erb :index
		else
			redirect '/login'
		end
	end

	post '/' do
			Fweet.create(:user_id => session[:user_id], :content => params[:content])
			@fweets = Fweet.all
			redirect to("/")
	end

	get '/logout' do
		session[:user_id] = nil
		redirect '/login'
	end


	get '/new_user' do
		erb :new_user
	end

	post '/new_user' do
		User.create(username: params[:username], first_name: params[:firstname], last_name: params[:lastname])
		redirect to("/login")
	end

end


### Helper methods

def current_user
	User.find(session[:user_id])
end

def logged_in?
	session[:user_id]
end