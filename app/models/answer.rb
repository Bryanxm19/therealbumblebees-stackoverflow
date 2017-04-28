class Answer < ActiveRecord::Base
  validates :text, :user_id, :question_id, presence: true
  validates :user_id, uniqueness: { scope: :question_id }

  belongs_to :user
  belongs_to :question
  has_many :votes, as: :votable
  has_many :comments, as: :commentable

  include Countable
  include ActionView::Helpers::DateHelper
end
