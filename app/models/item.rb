class Item < ActiveRecord::Base
  # attr_accessible :title, :body

  attr_accessible :contact, :title, :type_of, :information

  validates :contact, presence: true, length: {maximum: 40}
  validates :title, presence: true, length: {maximum: 40}
  validates :type_of, presence: true, length: {maximum: 40}
  validates :information, presence: true, length: {maximum: 1000}

end
