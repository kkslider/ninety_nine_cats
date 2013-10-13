require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessible :user_name, :password_digest
  validates :user_name, :password_digest, :session_token, presence: true
  validates :user_name, :session_token, uniqueness: true
  
  def reset_session_token
    # SecureRandom::urlsafe_base64(16)
    self.session_token = SecureRandom::urlsafe_base64(16)
  end
  
  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end
  
  def is_password?(password)
    
  end
  
  
end