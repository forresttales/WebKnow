# == Schema Information
#
# Table name: publisher_ads
#
#  id                     :integer          not null, primary key
#  user_id                :integer
#  publisher_id           :integer
#  ad_name                :string(255)
#  ad_subject             :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  ad_index               :integer          default(0)
#  ad_description         :string(255)
#  ad_status_purchased    :boolean          default(FALSE)
#  ad_status_public       :boolean          default(FALSE)
#  ad_date_exp            :datetime
#  ad_date_init           :datetime
#  ad_amount              :decimal(8, 2)    default(0.0)
#  ad_status_public_index :integer          default(0)
#  ad_status_public_msg   :string(255)
#  auth_code              :string(255)
#  publisher_product_id   :integer          default(0)
#

class PublisherAd < ActiveRecord::Base
  
  attr_accessible :user_id,
                  :publisher_id,
                  :publisher_product_id,
                  :ad_index,
                  :ad_description,
                  :ad_amount,
                  :ad_status_purchased,
                  :ad_status_public,
                  :ad_status_public_index,
                  :ad_status_public_msg,
                  :auth_code,
                  :ad_date_exp,
                  :ad_date_init
  
  
  
  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_ads")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_ads_id_seq RESTART WITH 1")
  end

  
end

