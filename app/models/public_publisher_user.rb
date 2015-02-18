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
#

class PublicPublisherUser < PublisherUser
  
end
