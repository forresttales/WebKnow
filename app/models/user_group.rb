# == Schema Information
#
# Table name: user_groups
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name_group :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class UserGroup < ActiveRecord::Base
end
