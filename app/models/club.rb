class Club < ActiveRecord::Base
  # attr_accessible :title, :body

  attr_accessible :date, :content, :title, :send

  validates :send, presence: true, length: {maximum: 40}
  validates :content, presence: true, length: {maximum: 400}
  validates :title, presence: true, length: {maximum: 40}
  validates :date, presence: true, length: {maximum: 40}

end
