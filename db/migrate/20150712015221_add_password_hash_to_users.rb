class AddPasswordHashToUsers < ActiveRecord::Migration
  def up
  	add_column :users, :password_hash, :string
	end

	def down
  	remove_column :users, :password_hash, :string
	end
end
