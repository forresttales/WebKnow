# == Schema Information
#
# Table name: user_friendships
#
#  id               :integer          not null, primary key
#  created_at       :datetime
#  updated_at       :datetime
#  user_id          :integer          default(0)
#  status           :integer          default(0)
#  status_text      :string(255)      default("")
#  accepted_at      :datetime
#  invitation_at    :datetime
#  user_initiate_id :integer          default(0)
#  user_friend_id   :integer          default(0)
#

class UserFriendship < ActiveRecord::Base
  
    attr_accessible :user_id,
                    :user_friend_id,
                    :user_initiate_id,
                    :status,    # can be 'pending', 'requested', 'accepted'
                    :status_text,
                    :invitation_at,
                    :accepted_at


    belongs_to :user
    belongs_to :user_friend, :class_name => 'User'

  

    def self.request(user, user_friend)
        unless user == user_friend or UserFriendship.exists?(:user_id => user.id, :user_friend_id => user_friend.id)
            transaction do
                # user.user_friendships.build(:user_friend => user_friend, :status => 'pending')
                # user_friend.user_friendships.build(:user_friend => user, :status => 'requested')
                create(:user_id => user.id, :user_friend_id => user_friend.id, :status => 'pending')
                create(:user_id => user_friend.id, :user_friend_id => user.id, :status => 'requested')
            end
        end
    end
    def self.accept(user, user_friend)
        transaction do
            accepted_at = Time.now
            accept_one_side(user, user_friend, accepted_at)
            accept_one_side(user_friend, user, accepted_at)
        end
    end
    def self.accept_one_side(user, user_friend, accepted_at)
        request = find_by_user_id_and_user_friend_id(user, user_friend)
        request.status = 'accepted'
        request.accepted_at = accepted_at
        request.save!
    end
    def self.remove(user, user_friend)
        unless user == user_friend or !UserFriendship.exists?(:user_id => user.id, :user_friend_id => user_friend.id)
            transaction do
                remove_one_side(user, user_friend)
                remove_one_side(user_friend, user)
            end
        end
    end
    def self.remove_one_side(user, user_friend)
        request = find_by_user_id_and_user_friend_id(user, user_friend)
        request.destroy!
    end



    def self.dbdelete
        self.connection.execute("DELETE FROM user_friendships")
    end
  
    def self.dbclear
        self.connection.execute("ALTER SEQUENCE user_friendships RESTART WITH 1")
    end
  
    
end
