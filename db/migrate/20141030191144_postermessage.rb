class Postermessage < ActiveRecord::Migration
  def change
  	add_column :users, :approval_message, :string
  end
end
