# == Schema Information
#
# Table name: institute_images
#
#  id           :integer          not null, primary key
#  institute_id :integer
#  image_name   :string(100)
#  primary      :boolean          default(FALSE)
#  created_at   :datetime
#  updated_at   :datetime
#

class InstituteImage < ActiveRecord::Base
end
