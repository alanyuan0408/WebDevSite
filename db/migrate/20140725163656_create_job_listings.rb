class CreateJobListings < ActiveRecord::Migration

 	def change
   		create_table :job_listings do |t|
     		t.string :title
     		t.text :text

      		t.timestamps
    	end
  	end

end
