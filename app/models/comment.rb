class Comment < ApplicationRecord
  belongs_to :user
  has_many :topics
 
  validates :user_id, presence: true
  validates :text, presence: true
end
