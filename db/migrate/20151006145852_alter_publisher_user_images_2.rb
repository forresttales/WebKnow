class AlterPublisherUserImages2 < ActiveRecord::Migration
  def change
    
    add_column :publisher_user_images, :width, :integer, :default => 0
    add_column :publisher_user_images, :height, :integer, :default => 0    

    add_index :publisher_user_images, "publisher_user_id", :name => 'index_publisher_user_images_on_publisher_user_id'        

  end
end
