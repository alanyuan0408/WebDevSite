class CreateItemposts < ActiveRecord::Migration
  def change
    create_table :item_posts do |t|

      t.string :title
      t.string :contact
      t.string :content

      t.timestamps
    end
  end
end
