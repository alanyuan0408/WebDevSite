class JobPost < ActiveRecord::Base
  attr_accessible :contact, :content, :title
  belongs_to :user

  validates :contact, presence: true, length: {maximum: 40}
  validates :content, presence: true, length: {maximum: 400}
  validates :title, presence: true, length: {maximum: 40}

  default_scope order: 'jobposts.create_at DESC'

end
