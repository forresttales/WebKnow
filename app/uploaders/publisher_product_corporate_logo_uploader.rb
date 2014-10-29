# encoding: utf-8
class PublisherProductCorporateLogoUploader < CarrierWave::Uploader::Base

  # include CarrierWave::MiniMagick
  include CarrierWave::RMagick
  

  storage :file
  # storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    # "uploads/#{model.class.to_s.underscore}"
    #images_publisher_journalposter_logo
  end


  def filename
     "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  process :resize_to_limit => [600, 600]
  
  # version :image do    
  # end

  # version :image_34_34 do
    # # process :resize_to_fill => [34, 34, gravity = ::Magick::CenterGravity]
    # process :resize_to_limit => [34, 34]
  # end

  # version :image_50_50 do
    # # process :resize_to_fill => [50, 50, gravity = ::Magick::CenterGravity]
    # process :resize_to_limit => [50, 50]
  # end

  # version :image_100_100 do
    # # process :resize_to_fill => [100, 100, gravity = ::Magick::CenterGravity]
    # process :resize_to_limit => [100, 100]
  # end

  version :image_200_200 do
    # process :resize_to_fill => [200, 200, gravity = ::Magick::CenterGravity]
    process :resize_to_limit => [200, 200]
  end

  # version :image_0_100 do
    # # process :resize_to_fill => [200, 200, gravity = ::Magick::CenterGravity]
    # process :resize_to_limit => [0, 100]
  # end

  # version :image_0_200 do
    # # process :resize_to_fill => [200, 200, gravity = ::Magick::CenterGravity]
    # process :resize_to_limit => [0, 200]
  # end

  # version :image_300_300 do
    # # process :resize_to_fill => [200, 200, gravity = ::Magick::CenterGravity]
    # process :resize_to_limit => [300, 300]
  # end

  # version :image_600_600 do
    # process :resize_to_limit => [600, 600]
    # # process :quality => 100

    # manipulate! do |img, index, options|
      # options[:write] = {
        # :quality => 50,
        # :depth => 8
      # }
      # img
    # end    

      # image.write do |img|
        # self.quality = 50
        # self.depth = 8
      # end
    
  # end

  # version :image_loaded do
  # end
  # version :image_500_500 do
    # process :resize_to_limit => [500, 500]
  # end
  # version :image_200_200 do
    # process :resize_to_limit => [200, 200]
  # end
  # version :image_100_100 do
    # process :resize_to_limit => [100, 100]
  # end
  # version :image_50_50 do
    # process :resize_to_fill => [50, 50, gravity = ::Magick::CenterGravity]
  # end

  def crop
  end


  protected

    def secure_token
      var = :"@#{mounted_as}_secure_token"
      model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
    end


end
