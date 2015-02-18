# == Schema Information
#
# Table name: relate_follows
#
#  id          :integer          not null, primary key
#  created_at  :datetime
#  updated_at  :datetime
#  follower_id :integer
#  followed_id :integer
#

class RelateFollow < ActiveRecord::Base
  
  attr_accessible :followed_id

  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  validates :follower_id, presence: true
  validates :followed_id, presence: true



  def self.dbdelete
      self.connection.execute("DELETE FROM relate_follows")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE relate_follows_id_seq RESTART WITH 1")
  end

  
end
