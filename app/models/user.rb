class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :email_frequency, :web_club_newsletter, :research, :jobs, :events, :expo_ticket
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, 	presence: true, uniqueness: true
  validates :email,	presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  validates :password_confirmation, presence: true, on: :create
  validates :email_frequency, presence: true, :numericality => {:only_integer => true, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 7 }

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token #create an admin user

  private 

  def create_remember_token

    if (!self.account_created)
  	  self.remember_token = SecureRandom.urlsafe_base64
      self.nextsend = Time.now + self.email_frequency.days
      self.account_created = true
    end

  end

end
