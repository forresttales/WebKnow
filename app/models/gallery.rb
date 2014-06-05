# == Schema Information
#
# Table name: galleries
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Gallery < ActiveRecord::Base
  
  attr_accessible :name

  has_many :paintings
  
end
