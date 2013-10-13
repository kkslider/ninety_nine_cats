require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessible :user_name, :password_digest
  validates :user_name, :password_digest, :session_token, presence: true
  validates :user_name, :session_token, uniqueness: true
  before_validation(on: :create) do
    self.reset_session_token! if !self.session_token
  end
  
  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64(16)
  end
  
  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end
  
  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
  
  def self.find_by_credentials(user_name, password)
    user = User.find_by_user_name(user_name)
    if user
      user.is_password?(password) ? user : nil
    end
  end
end