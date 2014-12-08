class Feedbank < ActiveRecord::Base
  # attr_accessible :title, :body

  attr_accessible :item_date, :item_url, :item_title, :item_text, :user_id, :approval_status, :column_type

end
