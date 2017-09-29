class User < ApplicationRecord
  has_secure_password

  validates :name, :email, presence: true
  validates :email, uniqueness: true
  validates :email, presence: true

  has_many :purchases
  has_many :friends
  



end
