# == Schema Information
#
# Table name: relate_log_users
#
#  id          :integer          not null, primary key
#  created_at  :datetime
#  updated_at  :datetime
#  follower_id :integer
#  followed_id :integer
#

class RelateLogUser < ActiveRecord::Base
  
  attr_accessible :followed_id

  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  validates :follower_id, presence: true
  validates :followed_id, presence: true



  def self.dbdelete
      self.connection.execute("DELETE FROM relate_log_users")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE relate_log_users_id_seq RESTART WITH 1")
  end

  
end
