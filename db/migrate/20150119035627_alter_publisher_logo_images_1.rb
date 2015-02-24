class AlterPublisherLogoImages1 < ActiveRecord::Migration
  def change
    
    add_column :publisher_logo_images, :user_id, :integer, :default => 0
    add_column :publisher_logo_images, :publisher_id, :integer, :default => 0
    add_column :publisher_logo_images, :image, :string
    add_column :publisher_logo_images, :image_name, :string
    add_column :publisher_logo_images, :primary, :boolean, :default => false
    add_column :publisher_logo_images, :order, :integer, :default => 0
    add_column :publisher_logo_images, :crop_x, :integer, :default => 0
    add_column :publisher_logo_images, :crop_y, :integer, :default => 0
    add_column :publisher_logo_images, :crop_w, :integer, :default => 0
    add_column :publisher_logo_images, :crop_h, :integer, :default => 0
    
    add_index :publisher_logo_images, :publisher_id
    
  end
end