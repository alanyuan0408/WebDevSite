class ChangeInfromationLimit < ActiveRecord::Migration
  def change
    add_column :items, :content, :binary, limit: 15.megabytes
    add_column :items, :information, :text, limit: 15.megabytes
  end

end
