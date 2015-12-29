# == Schema Information
#
# Table name: teks_career_dev_standards
#
#  id           :integer          not null, primary key
#  created_at   :datetime
#  updated_at   :datetime
#  order        :integer          default(0)
#  section_text :string(255)      default("")
#  chapter      :integer          default(0)
#  section      :integer          default(0)
#  uri          :string(255)      default("")
#

class TeksCareerDevStandard < ActiveRecord::Base
  
    attr_accessible :section_text,
                    :section,
                    :chapter,
                    :uri,
                    :order
  
  
  
    def self.dbdelete
        self.connection.execute("DELETE FROM teks_career_dev_standards")
    end
  
    def self.dbclear
        self.connection.execute("ALTER SEQUENCE teks_career_dev_standards_id_seq RESTART WITH 1")
    end


    def self.import(file)
    end


    def self.open_spreadsheet(file)
        case File.extname(file.original_filename)
            when ".csv" then Roo::Csv.new(file.path)
            when ".xls" then Roo::Excel.new(file.path)
            when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
        else raise "Unknown file type: #{file.original_filename}"
        end
    end

  
    def self.search_by_sql(s)
        where(s)
    end

  
end
