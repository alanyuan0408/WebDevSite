class Item < ActiveRecord::Base

  attr_accessible :contact, :title, :type_of, :information, :content, :user_id

  # validates :contact, presence: true, length: {maximum: 40}
  # validates :title, presence: true, length: {maximum: 40}
  # validates :type_of, presence: true, length: {maximum: 40}
  # validates :information, length: {maximum: 256}
  # validates :information, presence: true

end
