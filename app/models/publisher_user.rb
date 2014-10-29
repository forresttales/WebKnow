# == Schema Information
#
# Table name: publisher_users
#
#  id                  :integer          not null, primary key
#  created_at          :datetime
#  updated_at          :datetime
#  user_id             :integer          default(0)
#  publisher_id        :integer          default(0)
#  publisher_member_id :integer          default(0)
#

class PublisherUser < ActiveRecord::Base
  
  attr_accessible :user_id,
                  :publisher_id,
                  :publisher_member_id

  
  belongs_to :publisher_member
  
  has_many :publisher_user_images
  


  
  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_users")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_users_id_seq RESTART WITH 1")
  end


  
end
