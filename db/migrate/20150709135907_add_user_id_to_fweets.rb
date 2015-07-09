class AddUserIdToFweets < ActiveRecord::Migration
  def up
  	remove_column :fweets, :user
  	add_column :fweets, :user_id, :integer
  end

  def down
  	remove_column :fweets, :user_id, :integer
  end
end
