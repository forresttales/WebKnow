# == Schema Information
#
# Table name: post_user_comments
#
#  id           :integer          not null, primary key
#  created_at   :datetime
#  updated_at   :datetime
#  post_user_id :integer
#  user_id      :integer
#  comment_text :text             default("")
#

class PostUserComment < ActiveRecord::Base
  
  attr_accessible :post_user_id,
                  :user_id,
                  :comment_text

  
  belongs_to :post_user
  belongs_to :user



  def self.dbdelete
      self.connection.execute("DELETE FROM post_user_comments")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE post_user_comments_id_seq RESTART WITH 1")
  end


end
