class CreatePosters < ActiveRecord::Migration
  def change
    create_table :posters do |t|

      t.timestamps
    end
  end
end
