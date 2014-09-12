class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :email_frequency, :web_club_newsletter, :research, :jobs, :cs_events, :yncn_events
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, 	presence: true, uniqueness: true
  validates :email,	presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token #create an admin user

  private 

  def create_remember_token
  	self.remember_token = SecureRandom.urlsafe_base64

    if self.name == "UoftWebDev"
      self.admin = true
      #Create the admin account
    end

  end

end
