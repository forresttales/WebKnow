# encoding: utf-8
class PublisherProduct1ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick
  #include CarrierWave::RMagick
  

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

  version :image_loaded do
  end
  
  # version :image_600_600 do
    # process :resize_to_limit => [600, 600]
  # end
  version :image_325_210 do
    process :resize_to_limit => [325, 210]
  end
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
