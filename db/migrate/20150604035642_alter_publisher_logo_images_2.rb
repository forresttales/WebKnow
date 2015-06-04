class AlterPublisherLogoImages2 < ActiveRecord::Migration
  def change
    
    add_column :publisher_logo_images, :width, :integer, :default => 0
    add_column :publisher_logo_images, :height, :integer, :default => 0    
    
  end
end
