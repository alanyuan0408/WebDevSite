class CreateFeedbanks < ActiveRecord::Migration
  def change
    create_table :feedbanks do |t|

      t.timestamps
    end
  end
end
