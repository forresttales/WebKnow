# == Schema Information
#
# Table name: log_users
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class LogUser < ActiveRecord::Base
  
  attr_accessible :user_id


  
  belongs_to :user



  default_scope -> { order('created_at DESC') }



  def self.from_log_by(user)
    user.post_users.where("user_id = ?", user.id)
    # followed_user_ids = "SELECT followed_id FROM relate_follows WHERE follower_id = :user_id"
    # where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", user_id: user.id)
  end


  
  def self.dbdelete
      self.connection.execute("DELETE FROM log_users")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE log_users_id_seq RESTART WITH 1")
  end
  
end
