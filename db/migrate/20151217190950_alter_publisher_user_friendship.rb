class AlterPublisherUserFriendship < ActiveRecord::Migration
  def change

  	add_column :publisher_user_friendships, :accepted_at, :datetime

  end
end
