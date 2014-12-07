class Feedbank < ActiveRecord::Base
  # attr_accessible :title, :body

  attr_accessible :item_date, :item_url, :item_title, :item_text, :column_type

  validates :item_text, presence: true, length: {maximum: 1000}
  validates :item_title, presence: true, length: {maximum: 70}
  validates :item_url, presence: true, length: {maximum: 70}

end
