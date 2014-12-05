class UpdateFeedBank < ActiveRecord::Migration

  def change
	create_table :feedbanks do |t|

	  	add_column :feedbanks, :item_id, :string
	  	add_column :feedbanks, :item_url, :string
	  	add_column :feedbanks, :item_title, :string
	  	add_column :feedbanks, :item_date, :datetime
	  	add_column :feedbanks, :item_text, :text

  end

end
