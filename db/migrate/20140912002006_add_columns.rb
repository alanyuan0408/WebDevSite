class AddColumns < ActiveRecord::Migration
  def change
  	add_column :users, :web_club_newsletter, :boolean, :default => true
  	add_column :users, :research, :boolean, :default => true
  	add_column :users, :jobs, :boolean, :default => true
  	add_column :users, :cs_events, :boolean, :default => true
  	add_column :users, :yncn_events, :boolean, :default => true
  end
end
