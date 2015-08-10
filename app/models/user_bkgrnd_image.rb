# == Schema Information
#
# Table name: user_bkgrnd_images
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer          default(0)
#  image      :string(255)
#  image_name :string(255)
#  primary    :boolean          default(FALSE)
#  order      :integer          default(0)
#  crop_x     :integer          default(0)
#  crop_y     :integer          default(0)
#  crop_w     :integer          default(0)
#  crop_h     :integer          default(0)
#  width      :integer          default(0)
#  height     :integer          default(0)

class UserBkgrndImage < ActiveRecord::Base

	# attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  
	attr_accessible :user_id,
	              :image,
	              :image_name,
	              :primary,
	              :order,
	              :crop_x,
	              :crop_y,
	              :crop_w,
	              :crop_h,
	              :width,
	              :height,
	              :created_at,
	              :updated_at 


	mount_uploader :image, UserBkgrndImageUploader

	belongs_to :user

	def self.dbdelete
	  self.connection.execute("DELETE FROM user_bkgrnd_images")
	end

	def self.dbclear
	  self.connection.execute("ALTER SEQUENCE user_bkgrnd_images_id_seq RESTART WITH 1")
	end

end
