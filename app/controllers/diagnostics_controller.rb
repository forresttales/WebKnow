class DiagnosticsController < ApplicationController
  
  require 'RMagick'

  def rmagick
    images_path = "public/sample_images"
    file_name = "rmagick_generated_thumb.jpg"
    file_path = images_path + "/"+ file_name

    File.delete file_path if File.exists? file_path
    img = Magick::Image.read("lib/sample_images/magic.jpg").first
    thumb = img.scale(0.25)
    @path = file_name
    thumb.write file_path
  end
  
    
end
