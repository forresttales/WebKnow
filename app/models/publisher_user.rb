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
#  slug                :string(255)
#  location            :string(255)
#  job_title           :string(255)
#  phone_company       :string(255)
#  website             :string(255)
#  years_at_company    :integer          default(0)
#  email               :string(255)
#  name_alias          :string(255)
#  name_company        :string(255)
#  time_at_company     :string(255)
#  story_plot          :text             default("")
#  story_interest      :text             default("")
#  admin_1             :boolean          default(FALSE)
#  admin_2             :boolean          default(FALSE)
#  admin_3             :boolean          default(FALSE)
#

class PublisherUser < ActiveRecord::Base
  
  attr_accessible :publisher_id,
                  :user_id,
                  :publisher_member_id,
                  :location,
                  :name_alias,
                  :job_title,
                  :name_company,
                  :years_at_company,
                  :time_at_company,
                  :email,
                  :phone_company,
                  :website,
                  :story_plot,
                  :story_interest
                  # :slug


  # extend FriendlyId
  # friendly_id :id, use: [:slugged, :history]

  belongs_to :publisher
  belongs_to :publisher_member
  belongs_to :user
  
  has_many :publisher_user_images, dependent: :destroy
  has_many :publisher_user_logo_images, dependent: :destroy
  
  has_one :publisher_user_plot, dependent: :destroy
  has_one :publisher_user_interest, dependent: :destroy


  
  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_users")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_users_id_seq RESTART WITH 1")
  end


  
end
