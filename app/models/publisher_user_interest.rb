# == Schema Information
#
# Table name: publisher_user_interests
#
#  id                :integer          not null, primary key
#  created_at        :datetime
#  updated_at        :datetime
#  publisher_user_id :integer
#  publisher_id      :integer
#  user_id           :integer
#  interest_text     :text             default("")
#

class PublisherUserInterest < ActiveRecord::Base
  
  attr_accessible :publisher_user_id,
                  :publisher_id,
                  :user_id,
                  :interest_text
                  
                  
  belongs_to :publisher_user
  has_many :publisher_user_interest_images, dependent: :destroy
  
  
  
  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_user_interests")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_user_interests_id_seq RESTART WITH 1")
  end

  
end
