class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|

      #Model to store the new updates for the club
      t.string :title
      t.string :date
      t.string :content
      t.string :send

      t.timestamps
    end
  end
end
