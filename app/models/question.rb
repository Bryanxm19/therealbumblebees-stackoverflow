class Question < ActiveRecord::Base
  validates :title, :body, :user_id, presence: true

  belongs_to :user
  has_many :answers
  has_many :votes, as: :votable
  has_many :comments, as: :commentable

  include Countable
  include ActionView::Helpers::DateHelper

  def num_answers
    self.answers.length
  end
end
