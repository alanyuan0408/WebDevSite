class Poster < ActiveRecord::Migration

	def change
		create_table :poster do |t|
			t.string :name
			t.string :email
			t.boolean :account_created, :default => false
			t.boolean :expo_registration, :default => false
			t.boolean :account_approval, :default => false
			t.string :password_digest
   			t.string :password_confirmation
   			t.string :remember_token
			
			t.timestamps
		end
	end

end
