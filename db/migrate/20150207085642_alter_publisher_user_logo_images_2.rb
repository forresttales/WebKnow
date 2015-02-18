class AlterPublisherUserLogoImages2 < ActiveRecord::Migration
  def change
    
        add_index :publisher_user_logo_images, :publisher_user_id

  end
end
