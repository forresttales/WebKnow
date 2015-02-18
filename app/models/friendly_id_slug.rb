# == Schema Information
#
# Table name: friendly_id_slugs
#
#  id             :integer          not null, primary key
#  slug           :string(255)      not null
#  sluggable_id   :integer          not null
#  sluggable_type :string(50)
#  scope          :string(255)
#  created_at     :datetime
#

class FriendlyIdSlug < ActiveRecord::Base
  
  attr_accessible :slug, 
                  :sluggable_id, 
                  :sluggable_type, 
                  :scope 
    

  def self.dbdelete
      self.connection.execute("DELETE FROM friendly_id_slugs")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE friendly_id_slugs_id_seq RESTART WITH 1")
  end

    
end
