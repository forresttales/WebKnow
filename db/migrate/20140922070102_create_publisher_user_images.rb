class CreatePublisherUserImages < ActiveRecord::Migration
  def change
    create_table :publisher_user_images do |t|

      t.timestamps
    end
  end
end
