# == Schema Information
#
# Table name: bd_years
#
#  id         :integer          not null, primary key
#  year       :integer          default(0)
#  year_text  :string(255)
#  year_value :integer          default(0)
#  created_at :datetime
#  updated_at :datetime
#

class BdYear < ActiveRecord::Base
  
  attr_accessible :id,
                  :year,
                  :year_text,
                  :year_value,
                  :created_at, 
                  :updated_at 
  
  
  
  def self.dbdelete
      self.connection.execute("DELETE FROM bd_years")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE bd_years_id_seq RESTART WITH 1")
  end
  
end
