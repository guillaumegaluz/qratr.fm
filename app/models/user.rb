class User < ActiveRecord::Base
  has_many :favorites
  has_many :favorited_tracks, through: :favorites, class_name: "Track"

  attr_accessor :password
  before_save :encrypt_password

  validates :email, :username, :password, presence: true
  validates :email, :username, uniqueness: true
  validates :password, length: { minimum: 6 }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  def self.authenticate(email_or_username, password)
    user = User.find_by_email(email_or_username) || User.find_by_username(email_or_username)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
