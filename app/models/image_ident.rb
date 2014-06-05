# == Schema Information
#
# Table name: image_idents
#
#  id              :integer          not null, primary key
#  assigned_text   :string(255)
#  assigned_digit  :integer
#  created_at      :datetime
#  updated_at      :datetime
#  assigned_text_1 :string(255)
#  assigned_text_2 :string(255)
#

class ImageIdent < ActiveRecord::Base
  
  attr_accessible :id,
                  :assigned_text,
                  :assigned_digit,
                  :created_at,
                  :updated_at 


  
  def self.dbdelete
      self.connection.execute("DELETE FROM image_idents")
  end

  # ALTER SEQUENCE reports_something_seq RESTART 1000;  
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE image_idents_id_seq RESTART WITH 10001")
  end
  
  
end
