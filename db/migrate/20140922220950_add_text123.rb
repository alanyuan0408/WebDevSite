class AddText123 < ActiveRecord::Migration
  def change
  	add_column :items, :information, :text
  end
end
