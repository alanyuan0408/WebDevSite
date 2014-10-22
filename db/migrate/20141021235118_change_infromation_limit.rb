class ChangeInfromationLimit < ActiveRecord::Migration
  def change
  	remove_column :items, :content
    add_column :items, :content, :binary, limit: 15.megabytes
    remove_column :items, :information
    add_column :items, :information, :text, limit: 15.megabytes
  end

end
