# == Schema Information
#
# Table name: log_errors
#
#  id                  :integer          not null, primary key
#  created_at          :datetime
#  updated_at          :datetime
#  profile_index       :integer          default(0)
#  profile_description :string(255)
#  description         :string(255)
#  controller          :string(255)
#  action              :string(255)
#

class LogError < ActiveRecord::Base
  
  attr_accessible :profile_index,
                  :profile_description,
                  :controller,
                  :action,
                  :description


  def self.dbdelete
      self.connection.execute("DELETE FROM log_errors")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE log_errors_id_seq RESTART WITH 1")
  end

  
end
