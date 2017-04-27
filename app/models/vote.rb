class Vote < ActiveRecord::Base
  validates :user_id, :votable_id, :votable_type, :up_down, presence: true
  validates :user_id, uniqueness: { scope: [:votable_type, :votable_id] }

  belongs_to :user
  belongs_to :votable, polymorphic: true
end
