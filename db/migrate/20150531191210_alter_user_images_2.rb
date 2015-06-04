class AlterUserImages2 < ActiveRecord::Migration
  def change
    
    add_column :user_images, :width, :integer, :default => 0
    add_column :user_images, :height, :integer, :default => 0    
    
  end
end
