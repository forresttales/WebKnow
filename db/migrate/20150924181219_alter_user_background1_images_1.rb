class AlterUserBackground1Images1 < ActiveRecord::Migration
  def change
    
    add_column :user_background1_images, :user_id, :integer, :default => 0
    add_column :user_background1_images, :image, :string
    add_column :user_background1_images, :image_name, :string
    add_column :user_background1_images, :primary, :boolean, :default => false
    add_column :user_background1_images, :order, :integer, :default => 0
    add_column :user_background1_images, :crop_x, :integer, :default => 0
    add_column :user_background1_images, :crop_y, :integer, :default => 0
    add_column :user_background1_images, :crop_w, :integer, :default => 0
    add_column :user_background1_images, :crop_h, :integer, :default => 0
    add_column :user_background1_images, :width, :integer, :default => 0
    add_column :user_background1_images, :height, :integer, :default => 0    

    add_index :user_background1_images, "user_id", :name => 'index_user_background1_images_on_user_id'    

    
  end
end
