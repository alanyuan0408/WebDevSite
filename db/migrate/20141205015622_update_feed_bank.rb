class UpdateFeedBank < ActiveRecord::Migration

  def change
	create_table :feedbanks do |t|

	  	t.string :item_id
	  	t.string :item_url
	  	t.string :item_title
	  	t.datetime :item_date
	  	t.text :item_text

	  	t.timestamps
	end

  end

end
