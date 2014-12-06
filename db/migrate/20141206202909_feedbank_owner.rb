class FeedbankOwner < ActiveRecord::Migration

  def change
  	add_column :feedbanks, :user_id, :integer
  end

end
