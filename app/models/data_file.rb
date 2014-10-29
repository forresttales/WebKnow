# == Schema Information
#
# Table name: data_files
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

class DataFile < ActiveRecord::Base
  
  def self.save(upload)
    # name =  upload['datafile'].original_filename
    name =  upload.original_filename

    directory = "public/data"
    # create the file path
    path = File.join(directory, name)
    # write the file

    # uploaded_io = params[:upload_file]
# 
    # File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      # file.write(uploaded_io.read)
    # end

    File.open(path, "wb") { |f| f.write(upload.read) }

    # File.open(path, "wb") { |f| f.write(upload['datafile'].read) }

  end
    
end
