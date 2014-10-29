class AlterPublisherProfileImages1 < ActiveRecord::Migration
  def change
    
    add_column :publisher_profile_images, :crop_x, :integer, :default => 0
    add_column :publisher_profile_images, :crop_y, :integer, :default => 0
    add_column :publisher_profile_images, :crop_w, :integer, :default => 0
    add_column :publisher_profile_images, :crop_h, :integer, :default => 0

    remove_index(:publisher_profile_images, :name => 'index_publisher_profile_images_on_publisher_id')    
    remove_index(:publisher_profile_images, :name => 'index_publisher_profile_images_on_user_id')    
    
    add_index("publisher_profile_images", "publisher_id")

  end
end
