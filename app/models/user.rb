class User < ActiveRecord::Base
  validates :username, :email, presence: true, uniqueness: true

  has_many :questions
  has_many :answers
  has_many :votes

  has_secure_password

  # def self.authenticate(given_email, given_password)
  #   user = User.find_by(email: given_email)
  #   binding.pry
  #   if user != nil && user.password == given_password
  #     return user
  #   else
  #     return nil
  #   end
  # end
end
