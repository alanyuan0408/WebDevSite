class OwnerDisapproved < ActiveRecord::Migration
  def change
  	add_column :users, :content_disapproved, :boolean, :default => false
  end
end
