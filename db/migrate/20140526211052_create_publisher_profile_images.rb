class CreatePublisherProfileImages < ActiveRecord::Migration
  def change
    create_table :publisher_profile_images do |t|

      t.integer "user_id"
      t.integer "publisher_id"
      t.string "image", :limit => 255
      t.string "image_name", :limit => 255
      t.boolean "primary", :default => false
      t.integer "order", :default => 0      
      t.timestamps
      
    end
    
      add_index("publisher_profile_images", "publisher_id", :unique => true )
      add_index("publisher_profile_images", "user_id", :unique => true )
    
  end
end

  # :user_id
  # :publisher_id,
  # :image,
  # :image_name,
  # :primary,
  # :order
