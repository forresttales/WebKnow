# == Schema Information
#
# Table name: core_math_standards
#
#  id         :integer          not null, primary key
#  dot_not    :string(255)
#  uri        :string(255)
#  guid       :string(255)
#  url_prev   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class CoreMathStandard < ActiveRecord::Base
  
  attr_accessible :dot_not,
                  :uri,
                  :guid,
                  :url_prev
  
  
  
    def self.dbdelete
        self.connection.execute("DELETE FROM core_math_standards")
    end
    
    def self.dbclear
        self.connection.execute("ALTER SEQUENCE core_math_standards_id_seq RESTART WITH 1")
    end
  
    def self.import(file)
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
