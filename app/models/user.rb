# need to require and include bcrypt in order to have secure hashed passwords
require 'bcrypt'

class User < ActiveRecord::Base
  # Remember to create a migration!
  include BCrypt

  # these are validations for user attributes
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :username
  validates_uniqueness_of :username
  validates_presence_of :password
  validates_presence_of :email
  validates_uniqueness_of :email

  # this is a bcrypt function that checks if an instance variable 'password' exists (an encrypted password) and if not, creates one that is set to the Password.new, using the password_hash obtained from the function below (this 'password_hash' is what needs to match the column name from the migration file)
  def password
  	@password ||= Password.new(password_hash)
  end

  # this is a bcrypt function that takes an unencrypted password (what the user enters) and turns it into a password hash and sets it as an instance variable
  def password=(new_password)
  	@password = Password.create(new_password)
  	self.password_hash = @password
  end

end



