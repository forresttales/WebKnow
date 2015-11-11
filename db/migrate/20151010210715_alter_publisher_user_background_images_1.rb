class AlterPublisherUserBackgroundImages1 < ActiveRecord::Migration
  def change

    add_column :publisher_user_background_images, :user_id, :integer, :default => 0    
    add_column :publisher_user_background_images, :publisher_id, :integer, :default => 0
    add_column :publisher_user_background_images, :publisher_user_id, :integer, :default => 0
    add_column :publisher_user_background_images, :image, :string
    add_column :publisher_user_background_images, :image_name, :string
    add_column :publisher_user_background_images, :primary, :boolean, :default => false
    add_column :publisher_user_background_images, :order, :integer, :default => 0
    add_column :publisher_user_background_images, :crop_x, :integer, :default => 0
    add_column :publisher_user_background_images, :crop_y, :integer, :default => 0
    add_column :publisher_user_background_images, :crop_w, :integer, :default => 0
    add_column :publisher_user_background_images, :crop_h, :integer, :default => 0
    add_column :publisher_user_background_images, :width, :integer, :default => 0
    add_column :publisher_user_background_images, :height, :integer, :default => 0    

  end
end
