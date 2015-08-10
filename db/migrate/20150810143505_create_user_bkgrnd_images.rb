class CreateUserBkgrndImages < ActiveRecord::Migration
  def change
    create_table :user_bkgrnd_images do |t|

      t.timestamps
    end
  end
end
