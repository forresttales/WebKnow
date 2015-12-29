# == Schema Information
#
# Table name: publisher_products
#
#  id                   :integer          not null, primary key
#  publisher_id         :integer
#  created_at           :datetime
#  updated_at           :datetime
#  has_description      :boolean          default(FALSE)
#  product_logo         :string(100)
#  has_product_logo     :boolean          default(FALSE)
#  product_metadata     :string(100)
#  has_product_metadata :boolean          default(FALSE)
#  slug                 :string(255)
#  product_name         :string(255)
#  has_required_1       :boolean          default(FALSE)
#  has_required_2       :boolean          default(FALSE)
#  has_required_3       :boolean          default(FALSE)
#  has_required_4       :boolean          default(FALSE)
#  is_edited_1          :boolean          default(FALSE)
#  is_edited_2          :boolean          default(FALSE)
#

class PublisherProduct < ActiveRecord::Base
  
  attr_accessible :publisher_id,
                  :slug,
                  :product_name,
                  :has_description,
                  :product_logo,
                  :has_product_logo,
                  :product_metadata,
                  :has_product_metadata,
                  :has_required_1,
                  :has_required_2,
                  :has_required_3,
                  :has_required_4,
                  :is_edited_1,
                  :is_edited_2
  
  
  belongs_to :publisher
  
  has_one :issued_publisher_product_id, foreign_key: "publisher_product_id", dependent: :destroy
  
  has_one :publisher_product_manifest, dependent: :destroy
  has_one :publisher_product_description, dependent: :destroy
  has_one :publisher_product_topic, dependent: :destroy
  has_one :publisher_product_subject, dependent: :destroy
  # has_one :publisher_product_logo
  has_one :publisher_product_pos1_image, dependent: :destroy
  has_one :publisher_product_pos2_image, dependent: :destroy
  has_one :publisher_product_pos3_image, dependent: :destroy
  has_one :publisher_product_pos4_image, dependent: :destroy
  has_one :publisher_product_pos5_image, dependent: :destroy
  # has_one :publisher_product_metadatatag
  has_one :publisher_product_content_type, dependent: :destroy
  has_one :publisher_product_category_subject, dependent: :destroy
  # has_one :publisher_product_appropriate_grade
  # has_one :publisher_product_appropriate_age
  # has_one :publisher_product_from_age, dependent: :destroy
  # has_one :publisher_product_to_age, dependent: :destroy
  # has_one :publisher_product_from_grade, dependent: :destroy
  # has_one :publisher_product_to_grade, dependent: :destroy
  has_one :publisher_product_age_range, dependent: :destroy
  has_one :publisher_product_grade_range, dependent: :destroy      
  has_one :publisher_product_market_target, dependent: :destroy
  has_one :publisher_product_platform, dependent: :destroy
  has_one :publisher_product_file_type, dependent: :destroy
  has_one :publisher_product_character, dependent: :destroy
  has_one :publisher_product_enhancement, dependent: :destroy
  has_one :publisher_product_pricing_model, dependent: :destroy
  has_one :publisher_product_price, dependent: :destroy
  has_one :publisher_product_lesson_time, dependent: :destroy
  has_one :publisher_product_by_review, dependent: :destroy
  # has_one :publisher_product1_image
  # has_one :publisher_product2_image
  # has_one :publisher_product_corporate_logo

  # has_many :publisher_product_images
  has_many :publisher_product_pdfs, dependent: :destroy
  # has_many :publisher_product_pdf_images
  has_many :publisher_product_core_literacy_standards, dependent: :destroy
  has_one :publisher_product_core_math_standard, dependent: :destroy




  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_products")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_products_id_seq RESTART WITH 1")
  end



  def self.import(file)
    
      # self.connection.execute("ALTER SEQUENCE stores_id_seq RESTART WITH 1")
    
    # if self.last.nil?                                                     # added
      # self.connection.execute("ALTER SEQUENCE stores_id_seq RESTART WITH 1")
      # id_new = 1                                                          # added
    # else                                                                  # added
      # idlast = self.last                                                  # added
      # id_last = idlast.id                                                 # added
      # id_new = id_last + 1                                                # added      
    # end                                                                   # added
    
    # id_new = self.maximum(:id).next
    
    
    # spreadsheet = open_spreadsheet(file)
    # header = spreadsheet.row(1)
    # (2..spreadsheet.last_row).each do |i|
      # row = Hash[[header, spreadsheet.row(i)].transpose]
      # store = find_by_id(row["id"]) || new
      # store.attributes = row.to_hash.slice(*accessible_attributes)
      # # store.id = id_new                                                   # added
      # # id_new += 1                                                         # added      
      # store.save!
    # end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::Csv.new(file.path)
    #when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xls" then Roo::Excel.new(file.path)
    when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  
  def self.search_by_sql(s)
      where(s)
  end

  
  # def self.none
      # where(arel_table[:id].eq(nil).and(arel_table[:id].not_eq(nil)))
  # end
 
   
end
