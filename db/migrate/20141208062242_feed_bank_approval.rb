class FeedBankApproval < ActiveRecord::Migration

  def change
  	add_column :feedbanks, :approval_status, :boolean, :default => false
  end

end
