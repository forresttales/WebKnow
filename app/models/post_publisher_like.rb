# == Schema Information
#
# Table name: post_publisher_likes
#
#  id                :integer          not null, primary key
#  created_at        :datetime
#  updated_at        :datetime
#  post_publisher_id :integer
#  user_id           :integer
#

class PostPublisherLike < ActiveRecord::Base
  
  attr_accessible :post_publisher_id,
                  :user_id
  
  
  belongs_to :post_publisher
  # belongs_to :user
  
  
  
  def self.dbdelete
      self.connection.execute("DELETE FROM post_publisher_likes")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE post_publisher_likes_id_seq RESTART WITH 1")
  end

  
end
