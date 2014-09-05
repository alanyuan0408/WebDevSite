class WeeklyReport4 < ActiveRecord::Migration
  def change
  	add_column :users, :email_frequency, :integer, :default => 7
  end
end
