# == Schema Information
#
# Table name: institute_settings
#
#  id           :integer          not null, primary key
#  institute_id :integer
#  background   :string(100)
#  created_at   :datetime
#  updated_at   :datetime
#

class InstituteSetting < ActiveRecord::Base
  
  attr_accessible :id,
                  :institute_id,
                  :background,
                  :created_at,
                  :updated_at 
  
  
  belongs_to :institute
  
    
end
