require_relative "../../config/environment.rb"

class ApplicationController < Sinatra::Base

	get "/" do
		"Hello World"
	end
	
end