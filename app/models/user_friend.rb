# == Schema Information
#
# Table name: user_friends
#
#  id               :integer          not null, primary key
#  created_at       :datetime
#  updated_at       :datetime
#  user_id          :integer          default(0)
#  friend_id        :integer          default(0)
#  status           :integer          default(0)
#  status_text      :string(255)      default("")
#  user_initiate_id :integer          default(0)
#

class UserFriend < ActiveRecord::Base

    attr_accessible :user_id,
                    :user_friend_id,
                    :user_initiate_id,
                    :status,    # can be 'pending', 'requested', 'accepted'
                    :status_text


    belongs_to :user


  
    def self.dbdelete
        self.connection.execute("DELETE FROM user_friendships")
    end
  
    def self.dbclear
        self.connection.execute("ALTER SEQUENCE user_friendships RESTART WITH 1")
    end

  
end
