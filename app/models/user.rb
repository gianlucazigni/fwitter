require_relative "../../config/environment"

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

end