# == Schema Information
#
# Table name: institute_profiles
#
#  id           :integer          not null, primary key
#  institute_id :integer
#  name_logo    :string(100)
#  has_logo     :boolean          default(FALSE)
#  created_at   :datetime
#  updated_at   :datetime
#

class InstituteProfile < ActiveRecord::Base
  
  attr_accessible :id,
                  :institute_id,
                  :name_logo,
                  :has_logo,
                  :created_at,
                  :updated_at 
  
  
  belongs_to :institute

  
end
