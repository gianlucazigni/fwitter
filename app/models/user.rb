require_relative "../../config/environment"
require 'sqlite3'

class User < ActiveRecord::Base
	has_many :fweets

	include BCrypt

	def password
		@password = Password.new(password_hash)
	end

	def password=(new_password)
		@password = Password.create(new_password)
		self.password_hash = @password
	end

	# begin

	# 	db = SQLite3::Database.open "database.db"

	# 	stm = db.prepare "SELECT * FROM Cars LIMIT 5"
 #    	rs = stm.execute





	# end




end