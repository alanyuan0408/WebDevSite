class ConfirmationMail < ActiveRecord::Migration
  def change
  	add_column :users, :confirmationMail, :boolean, :default => false
  end
end
