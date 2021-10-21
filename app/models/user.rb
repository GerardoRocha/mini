class User < ApplicationRecord
  has_secure_password
  has_many :tweets

  validates :username, uniqueness: true
  validates :username, length: { minimum: 2, maximum: 10 }
  validates :password, length: { in: 6..8 }
end