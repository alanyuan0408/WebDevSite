class CreateJobPosts < ActiveRecord::Migration
  def change
    create_table :job_posts do |t|
      t.string :title
      t.string :contact
      t.string :content

      t.timestamps
    end
  end
end
