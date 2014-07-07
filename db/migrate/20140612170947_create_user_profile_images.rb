class CreateUserProfileImages < ActiveRecord::Migration
  def change
    create_table :user_profile_images do |t|

      t.integer "user_id"
      t.string "image", :limit => 255
      t.string "image_name", :limit => 255
      t.boolean "primary", :default => false
      t.integer "order", :default => 0      

      t.timestamps
    end

      add_index("user_profile_images", "user_id")

  end
end
