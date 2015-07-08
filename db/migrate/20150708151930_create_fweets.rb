class CreateFweets < ActiveRecord::Migration
  def up
  	create_table :fweets do |t|
  		t.string :user
  		t.string :content
  	end
  end

  def down
  	drop_table :fweets
  end
end
