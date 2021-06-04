class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true, format: { with: /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/ }
  
  has_secure_password
  validates :password, presence: true, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,32}/ }\
  
  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
  has_many :comments
  has_many :comment_topics, through: :comments, source: 'topic'
end
