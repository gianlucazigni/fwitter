class AddUserProfilePicture < ActiveRecord::Migration
  def up
  	add_column :users, :profile_image, :string
  end
  def down
  	remove_column :users, :profile_image, :string
  end
end