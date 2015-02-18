class CreatePostPublishers < ActiveRecord::Migration
  def change
    create_table :post_publishers do |t|

      t.timestamps
    end
  end
end
