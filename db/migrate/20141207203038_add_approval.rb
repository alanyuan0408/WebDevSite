class AddApproval < ActiveRecord::Migration
  def change
  	add_column :items, :approval_status, :string
  end
end
