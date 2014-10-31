class Sentapproval < ActiveRecord::Migration
  def change
  	add_column :users, :sent_approval, :boolean, :default => false
  	
  end
end
