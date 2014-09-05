class AddTypeToItem1 < ActiveRecord::Migration
  def change
  	add_column :items, :type_of, :string
  end
end
