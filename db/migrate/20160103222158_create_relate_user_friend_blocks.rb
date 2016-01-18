class CreateRelateUserFriendBlocks < ActiveRecord::Migration
  def change
    create_table :relate_user_friend_blocks do |t|

      t.timestamps
    end
  end
end
