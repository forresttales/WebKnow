# == Schema Information
#
# Table name: post_publishers
#
#  id           :integer          not null, primary key
#  created_at   :datetime
#  updated_at   :datetime
#  user_id      :integer
#  publisher_id :integer
#  post_text    :text             default("")
#  b_group      :boolean          default(FALSE)
#

class PostPublisher < ActiveRecord::Base
  
  attr_accessible :publisher_id,
                  :user_id,
                  :post_text

  
  belongs_to :publisher
  has_many :post_publisher_likes, dependent: :destroy
  has_many :post_publisher_images, dependent: :destroy
  has_many :post_publisher_comments, dependent: :destroy
  
  
  # has_many :post_user_images
  
  default_scope -> { order('created_at DESC') }

  # validates :content, presence: true, length: { maximum: 140 }  
  # validates :user_id, presence: true

  # Returns post_users from the users being followed by the given user.
  def self.from_users_followed_by(user)
    
    followed_user_ids = "SELECT followed_id FROM relate_publisher_follows WHERE follower_id = :user_id"
    
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", user_id: user.id)
    
  end


  
  def self.dbdelete
      self.connection.execute("DELETE FROM post_publishers")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE post_publishers_id_seq RESTART WITH 1")
  end
  
end
