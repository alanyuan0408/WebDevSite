class Poster < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :email, :account_created, :expo_registrationm :account_approval, :password_confirmation


end
