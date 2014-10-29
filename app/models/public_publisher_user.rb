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

class PublicPublisherUser < PublisherUser
  
end
