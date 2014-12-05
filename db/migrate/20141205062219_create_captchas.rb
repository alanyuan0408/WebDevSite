class CreateCaptchas < ActiveRecord::Migration
  def change
    create_table :captchas do |t|

      t.timestamps
    end
  end
end
