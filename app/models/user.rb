class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :email_frequency, :web_club_newsletter, :research, :jobs, :events, :expo_ticket, :approval_message, :organization, :email_confirmation_token, :confirmationMail
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, 	presence: true
  validates :email,	presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  validates :password_confirmation, presence: true, on: :create
  validates :email_frequency, presence: true, :numericality => {:only_integer => true, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 7 }

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token #create an admin user

  after_commit :send_confirmation_email, on: :create

  private 

  def create_remember_token

    if (!self.account_created)
  	  self.remember_token = SecureRandom.urlsafe_base64
      self.nextsend = Time.now + self.email_frequency.days
      self.account_created = true
    end

    if self.name == "Admin" && self.email = "alan.yuan@mail.utoronto.ca"
      self.admin = "true"
    end

  end

  def send_confirmation_email
      if self.confirmationMail == "true"
        #Nothing
      else
         self.confirmationMail = "true"
          # send user email of confirmation if they haven't confirmed their email yet
         self.update_column(:email_confirmation_token, SecureRandom.urlsafe_base64)
         
         UserMailer.welcome_email(self).deliver
      end
  end

end
