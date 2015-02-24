class CreatePostPublisherComments < ActiveRecord::Migration
  def change
    create_table :post_publisher_comments do |t|

      t.timestamps
    end
  end
end
