class ChangeContentToBlob < ActiveRecord::Migration


  def change
  	remove_column :items, :content
    add_column :items, :content, :binary, :limit => 5.megabyte
  end


end
