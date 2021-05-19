class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true, format: { with: /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/ }
  
  has_secure_password
  validates :password, presence: true, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,32}/ }
end
