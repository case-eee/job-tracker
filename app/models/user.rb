class User < ActiveRecord::Base
  validates :user_name, presence: true, uniqueness: true
  validates :password, presence: true

  has_secure_password

  enum role: %w(default admin)
end
