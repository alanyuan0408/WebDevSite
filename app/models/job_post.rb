class JobPost < ActiveRecord::Base
  attr_accessible :contact, :content, :title
  belongs_to :user

  validates :contact, presence: true
  validates :content, presence: true
  validates :title, presence: true

end
