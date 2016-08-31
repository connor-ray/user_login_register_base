# creates a users table with columns for the attributes shown
# (the key password hash needs to match what you use in the bcrypt functions)

class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :first_name
  		t.string :last_name
  		t.string :username
  		t.string :email
  		t.string :password_hash
  	end
  end
end