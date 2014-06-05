# == Schema Information
#
# Table name: journal1poster_positions
#
#  id           :integer          not null, primary key
#  id_map       :integer
#  pos_x        :integer          default(0)
#  pos_y        :integer          default(0)
#  created_at   :datetime
#  updated_at   :datetime
#  section      :integer          default(0)
#  section_text :string(255)
#  section_pos  :integer          default(0)
#

class Journal1posterPosition < ActiveRecord::Base
  
  attr_accessible :id,
                  :id_map,   
                  :pos_x,      
                  :pos_y,
                  :section,
                  :section_text,
                  :section_pos,
                  :created_at, 
                  :updated_at 
  
  
  belongs_to :journal1poster
  
  
  def self.dbdelete
      self.connection.execute("DELETE FROM journal1poster_positions")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE journal1poster_positions_id_seq RESTART WITH 1")
  end

  
end
