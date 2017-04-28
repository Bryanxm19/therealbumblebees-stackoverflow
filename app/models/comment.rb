class Comment < ActiveRecord::Base
  validates :user_id, :commentable_id, :commentable_type, :text, presence: true


  belongs_to :user
  belongs_to :commentable, polymorphic: true
end
