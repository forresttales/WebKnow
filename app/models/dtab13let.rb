# == Schema Information
#
# Table name: dtab13lets
#
#  id         :integer          not null, primary key
#  col_order  :integer
#  col_1      :string(255)
#  col_2      :string(255)
#  col_3      :string(255)
#  col_4      :string(255)
#  col_5      :string(255)
#  col_6      :string(255)
#  col_7      :string(255)
#  col_8      :string(255)
#  col_9      :string(255)
#  col_10     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Dtab13let < ActiveRecord::Base
  
  attr_accessible :col_order,
                  :col_1,
                  :col_2,
                  :col_3,
                  :col_4,
                  :col_5,
                  :col_6,
                  :col_7,
                  :col_8,
                  :col_9,
                  :col_10,
                  :created_at,
                  :updated_at  

  
  def self.dbdelete
      self.connection.execute("DELETE FROM dtab13lets")
  end

  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE dtab13lets_id_seq RESTART WITH 1")
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
