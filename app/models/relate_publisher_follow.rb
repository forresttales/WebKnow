# == Schema Information
#
# Table name: relate_publisher_follows
#
#  id          :integer          not null, primary key
#  created_at  :datetime
#  updated_at  :datetime
#  follower_id :integer
#  followed_id :integer
#

class RelatePublisherFollow < ActiveRecord::Base
  
  attr_accessible :followed_id

  belongs_to :follower, class_name: "Publisher"
  belongs_to :followed, class_name: "Publisher"

  validates :follower_id, presence: true
  validates :followed_id, presence: true



  def self.dbdelete
      self.connection.execute("DELETE FROM relate_publisher_follows")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE relate_publisher_follows_id_seq RESTART WITH 1")
  end

  
end
