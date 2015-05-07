# encoding: utf-8

class PublisherUserInterestImageUploader < CarrierWave::Uploader::Base

  # include CarrierWave::MiniMagick
  include CarrierWave::RMagick
  
  
  storage :file
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


  def filename
     "#{secure_token}.#{file.extension}" if original_filename.present?
  end



  version :user_600_600 do
    process :resize_to_limit => [600, 600]
  end

  
  def crop
  end  
  

  protected

    def secure_token
      var = :"@#{mounted_as}_secure_token"
      model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
    end

end
