class CreateRelateUserFriendInvitations < ActiveRecord::Migration
  def change
    create_table :relate_user_friend_invitations do |t|

      t.timestamps
    end
  end
end
