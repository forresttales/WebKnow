# == Schema Information
#
# Table name: post_user_likes
#
#  id           :integer          not null, primary key
#  created_at   :datetime
#  updated_at   :datetime
#  post_user_id :integer
#  user_id      :integer
#

class PostUserLike < ActiveRecord::Base
  
  attr_accessible :post_user_id,
                  :user_id
  
  
  belongs_to :post_user
  belongs_to :user
  
  

  
  def self.dbdelete
      self.connection.execute("DELETE FROM post_user_likes")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE post_user_likes_id_seq RESTART WITH 1")
  end
  
end
