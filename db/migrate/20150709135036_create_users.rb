class CreateUsers < ActiveRecord::Migration

  def up
  	create_table :users do |t|
  		t.string :username
  		t.string :first_name
  		t.string :last_name
  	end
  end

  def down
  	drop_table :users
  end
end
