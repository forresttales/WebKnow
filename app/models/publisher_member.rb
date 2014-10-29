# == Schema Information
#
# Table name: publisher_members
#
#  id                :integer          not null, primary key
#  created_at        :datetime
#  updated_at        :datetime
#  user_id           :integer          default(0)
#  publisher_id      :integer          default(0)
#  publisher_user_id :integer          default(0)
#

class PublisherMember < ActiveRecord::Base
# class PublisherMember < PublisherUser
  
  attr_accessible :user_id,
                  :publisher_id
                  # :publisher_user_id

  # attr_accessible :publisher_user_id

  has_one :publisher_user
  
  belongs_to :publisher
  


  
  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_members")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_members_id_seq RESTART WITH 1")
  end
  
    
end
