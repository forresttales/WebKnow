# encoding: utf-8
class PublisherProfileUploader < CarrierWave::Uploader::Base

  # include CarrierWave::MiniMagick
  include CarrierWave::RMagick
  

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

  version :profile_34_34 do
    # process :resize_to_fill => [34, 34, gravity = ::Magick::CenterGravity]
    process :resize_to_limit => [34, 34]
  end

  version :profile_50_50 do
    # process :resize_to_fill => [50, 50, gravity = ::Magick::CenterGravity]
    process :resize_to_limit => [50, 50]
  end

  version :profile_100_100 do
    # process :resize_to_fill => [100, 100, gravity = ::Magick::CenterGravity]
    process :resize_to_limit => [100, 100]
  end

  version :profile_200_200 do
    # process :resize_to_fill => [200, 200, gravity = ::Magick::CenterGravity]
    process :resize_to_limit => [200, 200]
  end

  version :profile_0_100 do
    # process :resize_to_fill => [200, 200, gravity = ::Magick::CenterGravity]
    process :resize_to_limit => [0, 100]
  end

  version :profile_0_200 do
    # process :resize_to_fill => [200, 200, gravity = ::Magick::CenterGravity]
    process :resize_to_limit => [0, 200]
  end

  version :profile_300_300 do
    # process :resize_to_fill => [200, 200, gravity = ::Magick::CenterGravity]
    process :resize_to_limit => [300, 300]
  end

  version :profile_600_600 do
    process :resize_to_limit => [600, 600]
    # process :quality => 100

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
    
  end

  # def reprocess(x,y,w,h)
    # manipulate! do |img|
      # img.crop(x.to_i, y.to_i, w.to_i, h.to_i, true) 
      # end
    # resize_to_limit(180,180)  
  # end

  
  def crop
    # # return unless model.cropping?
    # # if model.crop_x.present?
      # # resize_to_limit(600, 600)
      # manipulate! do |img|
        # # img.crop("#{model.crop_w}x#{model.crop_h}+#{model.crop_x}+#{model.crop_y}")
        # x = model.crop_x.to_i
        # y = model.crop_y.to_i
        # w = model.crop_w.to_i
        # h = model.crop_h.to_i
        # img.crop!(x, y, w, h)
        # # x = 0
        # # y = 162
        # # w = 600
        # # h = 600
        # # resize_to_limit(600, 600)
        # # # img.crop(x, y, w, h)
        # # img.crop "#{w}x#{h}+#{x}+#{y}"
        # # img
        # # img.crop("#{model.crop_w}x#{model.crop_h}+#{model.crop_x}+#{model.crop_y}")
      # end
    # # end
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