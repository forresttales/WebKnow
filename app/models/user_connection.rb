# == Schema Information
#
# Table name: user_connections
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  connection_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class UserConnection < ActiveRecord::Base
end
