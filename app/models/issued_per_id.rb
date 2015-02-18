# == Schema Information
#
# Table name: issued_per_ids
#
#  id           :integer          not null, primary key
#  created_at   :datetime
#  updated_at   :datetime
#  id_per       :string(255)
#  profile_type :integer          default(0)
#  profile_id   :integer          default(0)
#

class IssuedPerId < ActiveRecord::Base
  
  attr_accessible :id_per

  
  def self.dbdelete
      self.connection.execute("DELETE FROM issued_per_ids")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE issued_per_ids_id_seq RESTART WITH 1")
  end

  
end
