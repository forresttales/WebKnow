# == Schema Information
#
# Table name: address_states
#
#  id          :integer          not null, primary key
#  state       :integer          default(0)
#  state_text  :string(255)
#  state_value :integer          default(0)
#  created_at  :datetime
#  updated_at  :datetime
#

class AddressState < ActiveRecord::Base

  attr_accessible :id,
                  :state,
                  :state_text,
                  :state_value,
                  :created_at, 
                  :updated_at 
  
  
  
  def self.dbdelete
      self.connection.execute("DELETE FROM address_states")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE address_states_id_seq RESTART WITH 1")
  end


end
