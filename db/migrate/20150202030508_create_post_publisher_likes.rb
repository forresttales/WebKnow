class CreatePostPublisherLikes < ActiveRecord::Migration
  def change
    create_table :post_publisher_likes do |t|

      t.timestamps
    end
  end
end
