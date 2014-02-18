# == Schema Information
#
# Table name: slugs
#
#  id          :integer          not null, primary key
#  slug        :string(200)
#  target_type :string(25)
#  target_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Slug < ActiveRecord::Base
end
