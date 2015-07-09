require_relative "../../config/environment.rb"
require_relative "../models/fweet.rb"
require_relative "../models/user.rb"

class ApplicationController < Sinatra::Base

	configure do
		set :public_folder, 'public'
		set :views, 'app/views'
	end

	get "/" do
		@users = User.all
		@fweets = Fweet.all
		erb :index
	end

	post '/' do
		Fweet.create(:user_id => params[:user], :content => params[:content])
		@fweets = Fweet.all
		redirect to("/")
	end

	get '/new_user' do
		erb :new_user
	end

	post '/new_user' do
		User.create(username: params[:username], first_name: params[:firstname], last_name: params[:lastname])
		redirect to("/")
	end

end
