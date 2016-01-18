# == Schema Information
#
# Table name: relate_user_friends
#
#  id          :integer          not null, primary key
#  created_at  :datetime
#  updated_at  :datetime
#  friend_1_id :integer          default(0)
#  friend_2_id :integer          default(0)
#

class RelateUserFriend < ActiveRecord::Base
  
    attr_accessible :friend_1_id,
                    :friend_2_id
  
  
    belongs_to :friend_1, class_name: "User"
    belongs_to :friend_2, class_name: "User"
  
    validates :friend_1_id, presence: true
    validates :friend_2_id, presence: true

  
  
    def self.from_relate_user_friends_by(user)
      relate_user_friend_ids = where("friend_1_id = :user_id OR friend_2_id = :user_id", user_id: user.id)
    end

    def self.from_relate_user_friend_by(current_user_id, user_id)
      relate_user_friend = nil
      relate_user_friends = where("friend_1_id = :user_id OR friend_2_id = :user_id", user_id: user_id) rescue nil
      if !relate_user_friends.nil?
          # Rails.logger.info('relate_user_friends was not nil')
          relate_user_friend = relate_user_friends.where("friend_1_id = :current_user_id OR friend_2_id = :current_user_id", current_user_id: current_user_id).first rescue nil
      else
          # Rails.logger.info('relate_user_friends was nil')  
      end
      
      return relate_user_friend
    end



    def self.dbdelete
        self.connection.execute("DELETE FROM post_users")
    end
  
    def self.dbclear
        self.connection.execute("ALTER SEQUENCE post_users_id_seq RESTART WITH 1")
    end

  
end
