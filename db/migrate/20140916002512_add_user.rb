class AddUser < ActiveRecord::Migration
  def change
  	add_column :users, :yncn, :boolean, :default => false

  end
end
