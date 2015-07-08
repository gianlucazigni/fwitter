require_relative "../../config/environment.rb"
require_relative "../models/fweet.rb"

class ApplicationController < Sinatra::Base

	configure do
		set :public_folder, 'public'
		set :views, 'app/views'
	end

	get "/" do
		@fweets = Fweet.all
		erb :index
	end

	post '/'
		Fweet.create(:user => params[:user], :content => params[:fweet])
	end

end
