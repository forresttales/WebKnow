# == Schema Information
#
# Table name: journal2posters
#
#  id                         :integer          not null, primary key
#  id_user                    :integer
#  publisher_id               :integer
#  publisher_journalposter_id :integer
#  map_position               :integer          default(0)
#  id_final                   :integer
#  url                        :string(255)
#  main_sales_phone           :string(255)
#  created_at                 :datetime
#  updated_at                 :datetime
#

class Journal2poster < ActiveRecord::Base
  
  attr_accessible :id,
                  :id_user,                  
                  :publisher_id,              
                  :publisher_journalposter_id, 
                  :pos_map,            
                  :url,                       
                  :main_sales_phone,          
                  :created_at,                
                  :updated_at  

  has_many :journal2poster_positions
  

  def self.dbdelete
      self.connection.execute("DELETE FROM journal2posters")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE journal2posters_id_seq RESTART WITH 1")
  end

  
end
