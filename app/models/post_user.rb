# == Schema Information
#
# Table name: post_users
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#  post_text  :text             default("")
#  b_group    :boolean          default(FALSE)
#

class PostUser < ActiveRecord::Base

  attr_accessible :user_id,
                  :post_text

  
  belongs_to :user
  has_many :post_user_likes, dependent: :destroy
  has_many :post_user_images, dependent: :destroy
  has_many :post_user_comments, dependent: :destroy
  
  # has_many :post_user_images
  
  default_scope -> { order('created_at DESC') }

  # validates :content, presence: true, length: { maximum: 140 }  
  # validates :user_id, presence: true

  # Returns post_users from the users being followed by the given user.
  def self.from_users_followed_by(user)
    
    followed_user_ids = "SELECT followed_id FROM relate_follows WHERE follower_id = :user_id"
    
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", user_id: user.id)
    
  end

  # def post_user_likes_count(post_user)
    # cnt = "SELECT * FROM post_user_likes WHERE post_user_id = :post_user.id"
    # #cnt = 123
  # end

  # def self.has_like_by(user)
    # b_has = false
    # # post_user_like = "SELECT * FROM post_user_likes WHERE post_user_id = :post_user_id AND user_id = :user_id"
    # # # where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", user_id: user.id)
    # # if !post_user_like.nil?
      # # b_has = true
    # # end
    # return b_has
  # end


  
  def self.dbdelete
      self.connection.execute("DELETE FROM post_users")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE post_users_id_seq RESTART WITH 1")
  end


end
