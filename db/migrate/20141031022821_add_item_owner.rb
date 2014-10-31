class AddItemOwner < ActiveRecord::Migration
  def change
  	add_column :items, :owner, :string
  end
end
