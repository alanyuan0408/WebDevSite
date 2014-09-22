class AddText12 < ActiveRecord::Migration
  def change
  	add_column :users, :nextsend, :time
  end
end
