class Item < ActiveRecord::Base
  # attr_accessible :title, :body

  attr_accessible :contact, :content, :title, :type_of

  validates :contact, presence: true, length: {maximum: 40}
  validates :content, presence: true, length: {maximum: 1000}
  validates :title, presence: true, length: {maximum: 40}
  validates :type_of, presence: true, length: {maximum: 40}

end
