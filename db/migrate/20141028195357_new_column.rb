class NewColumn < ActiveRecord::Migration

  def change
  	add_column :users, :expo_ticket, :boolean, :default => true
  	add_column :users, :nextsend, :datetime, :default => true
  end

end
