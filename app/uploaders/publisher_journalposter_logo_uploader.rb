# encoding: utf-8
class PublisherJournalposterLogoUploader < CarrierWave::Uploader::Base

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

  version :image_loaded do
  end
  version :image_500_500 do
    process :resize_to_limit => [500, 500]
  end
  version :image_200_200 do
    process :resize_to_limit => [200, 200]
  end
  version :image_100_100 do
    process :resize_to_limit => [100, 100]
  end
  version :image_50_50 do
    process :resize_to_fill => [50, 50, gravity = ::Magick::CenterGravity]
  end

  version :a do
    process :resize_to_limit => [50, 50]
  end

  version :logo do
    process :resize_to_limit => [250, 150]
  end

  version :logo_140_100 do
    process :resize_to_limit => [140, 100]
  end

  version :logo_200_70 do
    process :resize_to_limit => [200, 70]
  end

  def crop
  end


  protected

    def secure_token
      var = :"@#{mounted_as}_secure_token"
      model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
    end


end
