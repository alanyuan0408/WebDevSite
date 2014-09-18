class Addtext < ActiveRecord::Migration

  def change
  	remove_column :items, :content, :string
  	add_column :items, :content, :text
  end

end
