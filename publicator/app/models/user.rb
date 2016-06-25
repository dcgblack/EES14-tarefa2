class User < ActiveRecord::Base
  validates_presence_of :email, :name, :password
  validates_confirmation_of :password
  validates_uniqueness_of :email
end
