class AlterPublisherUserImage1 < ActiveRecord::Migration
  def change
    
    add_column :publisher_user_images, :user_id, :integer, :default => 0
    add_column :publisher_user_images, :publisher_id, :integer, :default => 0
    add_column :publisher_user_images, :publisher_user_id, :integer, :default => 0
    add_column :publisher_user_images, :image, :string
    add_column :publisher_user_images, :image_name, :string
    add_column :publisher_user_images, :primary, :boolean, :default => false
    add_column :publisher_user_images, :order, :integer, :default => 0
    add_column :publisher_user_images, :crop_x, :integer, :default => 0
    add_column :publisher_user_images, :crop_y, :integer, :default => 0
    add_column :publisher_user_images, :crop_w, :integer, :default => 0
    add_column :publisher_user_images, :crop_h, :integer, :default => 0
    
    
  end
end


    # :user_id,
    # :publisher_id,
    # :publisher_user_id,
    # :image,
    # :image_name,
    # :primary,
    # :order,
    # :crop_x,
    # :crop_y,
    # :crop_w,
    # :crop_h,
  