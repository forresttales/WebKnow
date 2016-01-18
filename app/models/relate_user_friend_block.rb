# == Schema Information
#
# Table name: relate_user_friend_blocks
#
#  id            :integer          not null, primary key
#  created_at    :datetime
#  updated_at    :datetime
#  user_id       :integer          default(0)
#  user_block_id :integer          default(0)
#

class RelateUserFriendBlock < ActiveRecord::Base
  
  attr_accessible :user_id,
                  :user_block_id
  

  belongs_to :user #, class_name: "User"
  belongs_to :user_block, class_name: "User"

  validates :user_id, presence: true
  validates :user_block_id, presence: true



  def self.dbdelete
      self.connection.execute("DELETE FROM relate_user_friend_invitations")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE relate_user_friend_invitations_id_seq RESTART WITH 1")
  end

  
end
