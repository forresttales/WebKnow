class AlterUserBkgrndImages1 < ActiveRecord::Migration
  def change

  	add_column :user_bkgrnd_images, :width, :integer, :default => 0
    add_column :user_bkgrnd_images, :height, :integer, :default => 0
    add_column :user_bkgrnd_images, :user_id, :integer, :default => 0
    add_column :user_bkgrnd_images, :image, :string
    add_column :user_bkgrnd_images, :image_name, :string
    add_column :user_bkgrnd_images, :primary, :boolean, :default => false
    add_column :user_bkgrnd_images, :order, :integer, :default => 0
    add_column :user_bkgrnd_images, :crop_x, :integer, :default => 0
    add_column :user_bkgrnd_images, :crop_y, :integer, :default => 0
    add_column :user_bkgrnd_images, :crop_w, :integer, :default => 0
    add_column :user_bkgrnd_images, :crop_h, :integer, :default => 0
    
    add_index :user_bkgrnd_images, :user_id

  end
end
