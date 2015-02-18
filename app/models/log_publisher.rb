# == Schema Information
#
# Table name: log_publishers
#
#  id           :integer          not null, primary key
#  created_at   :datetime
#  updated_at   :datetime
#  publisher_id :integer
#  user_id      :integer
#

class LogPublisher < ActiveRecord::Base


  attr_accessible :publisher_id,
                  :user_id


  
  belongs_to :publisher



  default_scope -> { order('created_at DESC') }



  def self.from_log_by(user)
    user.post_publishers
    # followed_user_ids = "SELECT followed_id FROM relate_follows WHERE follower_id = :user_id"
    # where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", user_id: user.id)
  end


  
  def self.dbdelete
      self.connection.execute("DELETE FROM log_publishers")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE log_publishers_id_seq RESTART WITH 1")
  end


end
