class AddColumns < ActiveRecord::Migration
  def change
  	add_column :users, :web_club_newsletter, :boolean, :default => true
  	add_column :users, :research, :boolean, :default => true
  	add_column :users, :jobs, :boolean, :default => true
  	add_column :users, :events, :boolean, :default => true
  end
end
