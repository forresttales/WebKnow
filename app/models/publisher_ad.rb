# == Schema Information
#
# Table name: publisher_ads
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  publisher_id :integer
#  ad_name      :string(255)
#  ad_subject   :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class PublisherAd < ActiveRecord::Base
end
