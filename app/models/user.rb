class User < ApplicationRecord
  has_secure_password
  
  validates :username, uniqueness: true
  validates :password_digest, presence: true
  validates :firstname, presence: true
  validates :middlename, presence: true
  validates :lastname, presence: true
  validates :userinterface, presence: true
end
