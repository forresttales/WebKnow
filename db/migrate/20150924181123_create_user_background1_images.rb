class CreateUserBackground1Images < ActiveRecord::Migration
  def change
    create_table :user_background1_images do |t|

      t.timestamps
    end
  end
end
