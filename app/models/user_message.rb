# == Schema Information
#
# Table name: user_messages
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  sender_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class UserMessage < ActiveRecord::Base
end
