class CreatePublisherUserFriendships < ActiveRecord::Migration
  def change
    create_table :publisher_user_friendships do |t|
      t.integer :user_id
      t.integer :friend_id
      t.string :status

      t.timestamps
    end

    add_column :publisher_user_friendships, :user_id, :integer, :default => 0
    add_column :publisher_user_friendships, :friend_id, :integer, :default => 0
    add_column :publisher_user_friendships, :status, :integer, :default => ""
  end
end
