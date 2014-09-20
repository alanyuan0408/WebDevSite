class AddColumns3 < ActiveRecord::Migration

  def change
  	add_column :users, :cssu, :boolean
  	add_column :users, :csadmin, :boolean
  end

end
