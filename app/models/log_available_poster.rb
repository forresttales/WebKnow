# == Schema Information
#
# Table name: log_available_posters
#
#  id         :integer          not null, primary key
#  id_map     :integer
#  closed     :boolean          default(FALSE)
#  created_at :datetime
#  updated_at :datetime
#

class LogAvailablePoster < ActiveRecord::Base
  
  attr_accessible :id,
                  :id_map,                  
                  :closed,              
                  :created_at,                
                  :updated_at  



  def self.dbdelete
      self.connection.execute("DELETE FROM log_available_posters")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE log_available_posters_id_seq RESTART WITH 1")
  end
  
end
