class ItemType < ActiveRecord::Migration

  def change
  	add_column :feedbanks, :column_type, :integer
  end

end
