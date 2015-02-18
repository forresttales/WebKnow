class CreatePublisherUserLogoImages < ActiveRecord::Migration
  def change
    create_table :publisher_user_logo_images do |t|

      t.timestamps
    end
  end
end
