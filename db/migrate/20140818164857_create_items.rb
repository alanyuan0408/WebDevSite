class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|

      t.string :title
      t.string :contact
      t.string :content
      t.string :update

      t.timestamps
    end
  end
end