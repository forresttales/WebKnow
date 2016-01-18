# == Schema Information
#
# Table name: relate_user_friend_invitations
#
#  id                  :integer          not null, primary key
#  created_at          :datetime
#  updated_at          :datetime
#  user_friend_from_id :integer          default(0)
#  user_friend_to_id   :integer          default(0)
#

class RelateUserFriendInvitation < ActiveRecord::Base
  
    attr_accessible :user_friend_from_id,
                    :user_friend_to_id
  
  
    belongs_to :user_friend_from, class_name: "User"
    belongs_to :user_friend_to, class_name: "User"
  
    validates :user_friend_from_id, presence: true
    validates :user_friend_to_id, presence: true
  
  
    # def self.user_friends_invited(user)
      # user_friend_invited_ids = "SELECT user_friend_to_id FROM relate_user_friend_invitations WHERE user_friend_from_id = :user_friend_from_id"
      # where("user_friend_from_id IN (#{user_friend_invited_ids}) OR user_friend_from_id = :user_friend_from_id", user_friend_from_id: user.id)
    # end

    def self.from_relate_user_friend_invitation_by(user)
      relate_user_friend_invitation = where("user_friend_from_id = :user_id OR user_friend_to_id = :user_id", user_id: user.id).first
    end

    def self.from_relate_user_friend_invitations_received_by(user)
      user_friend_invitations_received_ids = where("user_friend_to_id = :user_friend_to_id", user_friend_to_id: user.id)
    end

    def self.from_relate_user_friend_invitations_sent_by(user)
      user_friend_invitations_sent_ids = where("user_friend_from_id = :user_friend_from_id", user_friend_from_id: user.id)
    end

    # def self.user_friend_invitations_sent(user)
      # user_friend_invitations_sent_ids = "SELECT user_friend_to_id FROM relate_user_friend_invitations WHERE user_friend_from_id = :user_friend_from_id"
      # where("user_friend_from_id IN (#{user_friend_invitations_sent_ids}) OR user_friend_from_id = :user_friend_from_id", user_friend_from_id: user.id)
    # end

    # def self.from_users_followed_by(user)
      # followed_user_ids = "SELECT followed_id FROM relate_follows WHERE follower_id = :user_id"
      # where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", user_id: user.id)
    # end



    # def get_relate_user_friend_invitations_received
      # RelateUserFriendInvitation.from_relate_user_friend_invitations_received_by(self)
    # end
    # def get_relate_user_friend_invitations_sent
      # RelateUserFriendInvitation.from_relate_user_friend_invitations_sent_by(self)
    # end


    def self.dbdelete
        self.connection.execute("DELETE FROM relate_user_friend_invitations")
    end
    
    def self.dbclear
        self.connection.execute("ALTER SEQUENCE relate_user_friend_invitations_id_seq RESTART WITH 1")
    end

  
end
