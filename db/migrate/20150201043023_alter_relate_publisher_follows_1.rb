class AlterRelatePublisherFollows1 < ActiveRecord::Migration
  def change
    
    add_column :relate_publisher_follows, :follower_id, :integer
    add_column :relate_publisher_follows, :followed_id, :integer
    
  end
end
