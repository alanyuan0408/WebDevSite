class Feedbank < ActiveRecord::Migration
  
  def change
  	add_column :feedbanks, :item_id, :text
  	add_column :feedbanks, :item_url, :text
  	add_column :feedbanks, :item_title, :text
  	add_column :feedbanks, :item_date, :text
  	add_column :feedbanks, :item_content, :text
  end

end
