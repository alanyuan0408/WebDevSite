class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|

      t.string :title
      t.string :contact

      t.timestamps
    end
  end
end