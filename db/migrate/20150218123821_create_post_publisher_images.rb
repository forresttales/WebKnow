class CreatePostPublisherImages < ActiveRecord::Migration
  def change
    create_table :post_publisher_images do |t|

      t.timestamps
    end
  end
end
