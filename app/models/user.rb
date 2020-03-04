class User < ApplicationRecord
  has_many :markers

  has_secure_password
  
  validates :email, presence: true, uniqueness: true
  validates :zip_code, presence: true
  validates :password, presence: true

  
end
