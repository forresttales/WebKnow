# == Schema Information
#
# Table name: user_profile_images
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  image      :string(255)
#  image_name :string(255)
#  primary    :boolean          default(FALSE)
#  order      :integer          default(0)
#  created_at :datetime
#  updated_at :datetime
#

class UserProfileImage < ActiveRecord::Base

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  
  attr_accessible :id,
                  :user_id,
                  :image,
                  :image_name,
                  :primary,
                  :order,
                  :crop_x,
                  :crop_y,
                  :crop_w,
                  :crop_h,
                  :created_at,
                  :updated_at 
  
  
  #attr_accessible :gallery_id, :name, :image, :remote_image_url
  #belongs_to :gallery
  #mount_uploader :image, ImageUploader

  mount_uploader :image, UserProfileUploader
  
  belongs_to :user
  
  
  
  # attr_accessible :name,
                  # :avatar
                  
                  
  # after_update :crop_image
  # after_create :crop_image

  # before_save :crop_image
  
  # after_update :reprocess_image, :if => :cropping?
  # mount_uploader :avatar, AvatarUploader

  # after_update :reprocess_image, :if => :cropping?
  
  
  # def cropping?
      # !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  # end
  
  
  
  # def crop_image
    # # image.process!
    # # Rails.logger.info image.path
    # image.recreate_versions! if crop_x.present?
  # end


  # def crop_image
      # # image = MiniMagick::Image.open(self.image.path)
      # image = MiniMagick::Image.open(img.path)
      # # crop_params = "#{params[:w]}x#{params[:h]}+#{params[:x]}+#{params[:y]}"
      # x = x.to_i
      # y = y.to_i
      # w = w.to_i
      # h = h.to_i
      # image.crop "#{w}x#{h}+#{x}+#{y}!"
      # image
      # #image.crop "438x438+0+162"
      # # image.recreate_versions!
      # # image.crop
  # end
  

  # def crop_image(x, y, w, h)
#     
      # # UserProfileUploader.crop(img, x, y, w, h)
#       
      # # image = MiniMagick::Image.open(self.image.path)
      # image = Magick::Image.read("public" + self.image.to_s)
      # # crop_params = "#{params[:w]}x#{params[:h]}+#{params[:x]}+#{params[:y]}"
      # x = x.to_i
      # y = y.to_i
      # w = w.to_i
      # h = h.to_i
      # image.crop!(x, y, w, h)
#       
      # # image.crop "#{w}x#{h}+#{x}+#{y}"
      # # image
      # #image.crop "438x438+0+162"
      # # image.recreate_versions!
      # # image.crop
  # end


  
  def self.dbdelete
      self.connection.execute("DELETE FROM user_profile_images")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE user_profile_images_id_seq RESTART WITH 1")
  end


  # private
#   
    # def reprocess_image
      # image.reprocess(crop_x,crop_y,crop_w,crop_h)
    # end  

  # def cropping?
    # !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  # end

# private
    # def reprocess_image
      # image.process!
      # image.recreate_versions!
    # end
  
    
end
