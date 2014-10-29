# == Schema Information
#
# Table name: publisher_product_pdfs
#
#  id                               :integer          not null, primary key
#  publisher_id                     :integer
#  publisher_product_id             :integer
#  publisher_product_description_id :integer
#  created_at                       :datetime
#  updated_at                       :datetime
#  name_file                        :string(255)
#  image                            :string(255)
#  name_pdf                         :string(255)
#  attachment                       :string(255)
#

class PublisherProductPdf < ActiveRecord::Base

  # attr_accessor :crop_x, :crop_y, :crop_w, :crop_h  
  
  attr_accessible :publisher_id,
                  :publisher_product_id,
                  :publisher_product_description_id,
                  :name_file,
                  :name_pdf,
                  :image,
                  :created_at,
                  :updated_at 
  
  
  mount_uploader :name_file, PublisherProductPdfUploader
  
  belongs_to :publisher_product
  
  has_one :publisher_product_pdf_image


  # before_save :update_file_attributes
  # def update_file_attributes
    # if file.present? && file_changed? 
      # self.content_type = file.file.content_type
      # self.file_size = file.file.size
      # self.file_name = read_attribute(:file)
    # end
  # end
  
  # before_create :default_name  
  # def default_name
    # # self.name ||= File.basename(image.filename, '.*').titleize if image
    # self.name ||= File.basename(file_name, '.*').titleize if file_name
                  # # File.basename(@page.form.path)
  # end


  before_save do
    # self.original_file = self.file.original_file
    # self.name_pdf = File.basename(@publisher_product_pdf_new.file.url)
    # self.name_pdf = File.basename(@publisher_product_pdf_new).to_s
    # self.name_pdf = File.basename(upload_pdf_publisher_product_descriptions_path(@publisher_product_pdf_new))
    # self.name_pdf = File.basename(original_filename, '.*').titleize if original_filename

    # upload_pdf_publisher_product_descriptions_path(@publisher_product_pdf_new)
  end  

  
  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_product_pdfs")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_product_pdfs_id_seq RESTART WITH 1")
  end

  
  # def self.save(upload)
    # name =  upload.original_filename
    # directory = "public/data"
    # path = File.join(directory, name)
    # File.open(path, "wb") { |f| f.write(upload.read) }
  # end

  
end
