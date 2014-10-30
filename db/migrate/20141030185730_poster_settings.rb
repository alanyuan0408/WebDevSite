class PosterSettings < ActiveRecord::Migration
  
  def change
  	add_column :users, :account_selected, :boolean, :default => false
  	add_column :users, :content_creator, :boolean, :default => false
  	add_column :users, :student_account, :boolean, :default => false
  	add_column :users, :content_approved, :boolean, :default => false
  end

end
