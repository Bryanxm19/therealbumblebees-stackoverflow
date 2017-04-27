class User < ActiveRecord::Base
  validates :username, :email, presence: true, uniqueness: true

  has_secure_password

  has_many :questions
  has_many :answers
  has_many :votes
end
