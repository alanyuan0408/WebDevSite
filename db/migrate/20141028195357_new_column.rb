class NewColumn < ActiveRecord::Migration

  def change
  	add_column :users, :expo_ticket, :boolean, :default => false
  	add_column :users, :nextsend, :datetime
  	add_column :users, :account_created, :boolean, :default => false
  end

end
