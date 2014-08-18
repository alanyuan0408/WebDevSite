class Item < ActiveRecord::Base
  # attr_accessible :title, :body

  attr_accessible :contact, :content, :title

  validates :contact, presence: true, length: {maximum: 40}
  validates :content, presence: true, length: {maximum: 400}
  validates :title, presence: true, length: {maximum: 40}

end
