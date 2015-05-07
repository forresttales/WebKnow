# == Schema Information
#
# Table name: post_publisher_comments
#
#  id                :integer          not null, primary key
#  created_at        :datetime
#  updated_at        :datetime
#  post_publisher_id :integer
#  publisher_id      :integer
#  user_id           :integer
#  comment_text      :text             default("")
#

class PostPublisherComment < ActiveRecord::Base

  attr_accessible :post_publisher_id,
                  :publisher_id,
                  :user_id,
                  :comment_text

  
  belongs_to :post_publisher
  belongs_to :publisher
  belongs_to :user



  def self.dbdelete
      self.connection.execute("DELETE FROM post_publisher_comments")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE post_publisher_comments_id_seq RESTART WITH 1")
  end


end
