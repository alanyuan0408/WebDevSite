class Captcha < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :text, :user_id
end
