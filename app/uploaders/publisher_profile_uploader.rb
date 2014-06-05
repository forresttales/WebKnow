# encoding: utf-8
class PublisherProfileUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file
  # storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


  def filename
     "#{secure_token}.#{file.extension}" if original_filename.present?
  end


  version :profile do
    
  end

  version :profile_50_50 do
    process :resize_to_limit => [50, 50]
  end

  version :profile_100_100 do
    process :resize_to_limit => [100, 100]
  end

  version :profile_300_300 do
    process :resize_to_limit => [300, 300]
  end

  version :profile_400_400 do
    process :resize_to_limit => [400, 400]
  end

  version :profile_600_600 do
    process :resize_to_limit => [600, 600]
  end


  protected

    def secure_token
      var = :"@#{mounted_as}_secure_token"
      model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
    end


  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end


end
