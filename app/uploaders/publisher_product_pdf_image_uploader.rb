# encoding: utf-8
class PublisherProductPdfImageUploader < CarrierWave::Uploader::Base

  #include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  storage :file
  # storage :fog


  # process :resize_to_limit => [200, 0]
  # process :convert => 'png'
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    # "uploads/#{model.class.to_s.underscore}"
    #images_publisher_journalposter_logo
  end


  def filename
     "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  version :image_200_270 do
    process :resize_to_limit => [200, 270]
    # process :resize_to_fill => [100, 100, gravity = ::Magick::CenterGravity]
    # process :resize_to_limit => [100, 100]
  end

  # version :image_loaded do
  # end

  # version :image_200_270 do
    # process :resize_to_limit => [200, 270]
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
