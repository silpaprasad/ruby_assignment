class User < ActiveRecord::Base
  has_secure_password
  has_many :profiles
  has_many :hobbies
end
