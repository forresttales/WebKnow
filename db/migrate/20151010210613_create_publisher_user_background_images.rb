class CreatePublisherUserBackgroundImages < ActiveRecord::Migration
  def change
    create_table :publisher_user_background_images do |t|

      t.timestamps
    end
  end
end
