# == Schema Information
#
# Table name: institute_queries
#
#  id                     :integer          not null, primary key
#  institute_id           :integer
#  name_query             :string(100)
#  has_result             :boolean          default(FALSE)
#  created_at             :datetime
#  updated_at             :datetime
#  type_content           :string(50)
#  subject_category       :string(50)
#  word_description       :string(1000)
#  type_content_index     :integer
#  subject_category_index :integer
#

class InstituteQuery < ActiveRecord::Base
  
  attr_accessible :id,
                  :institute_id,
                  :name_query,
                  :has_result,
                  :type_content_index,
                  :subject_category_index,                                    
                  :type_content,
                  :subject_category,
                  :word_description,                  
                  :created_at,
                  :updated_at 
  
  
  belongs_to :institute
  has_one :institute_query_result



  # def self.dbdelete
      # self.connection.execute("DELETE FROM stores")
  # end
   
  # def self.dbclear
      # self.connection.execute("ALTER SEQUENCE stores_id_seq RESTART WITH 1")
  # end


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

  
end
