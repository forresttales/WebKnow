# encoding: utf-8
class PublisherUserBackgroundImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  storage :file
  # storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def filename
     "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  version :image_1200_300_fit do
    process :resize_to_fit => [1200, 300]
  end

  version :image_1200_300_fill do
    process :resize_to_fill => [1200, 300]
  end

  version :image_800_500 do
    process :resize_to_limit => [800, 500]
  end

  version :image_500_500 do
    process :resize_to_limit => [500, 500]
  end


  protected

    def secure_token
      var = :"@#{mounted_as}_secure_token"
      model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
    end

  # include CarrierWave::MiniMagick
  # storage :file
  # def store_dir
    # "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  # end
  # def cache_dir
    # "cache_carrierwave"
  # end
  # def filename
     # "#{secure_token}.#{file.extension}" if original_filename.present?
  # end
  # version :image_100_100 do
    # process :resize_to_limit => [100, 100]
  # end
  # version :image_200_200 do
    # process :resize_to_limit => [200, 200]
  # end
  # version :image_345_300 do
    # process :resize_to_limit => [345, 300]
  # end
  # version :image_600_600 do
    # process :resize_to_limit => [600, 600]
  # end
  # def crop
  # end  
# 
  # protected
# 
    # def secure_token
      # var = :"@#{mounted_as}_secure_token"
      # model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
    # end


end
