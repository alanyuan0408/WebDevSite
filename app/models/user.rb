class User < ActiveRecord::Base
  attr_accessible :email, :name

  validates :name, 	presence: true, uniqueness: true
  validates :email,	presence: true

  before_save { |user| user.email = email.downcase }
end
