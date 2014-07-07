# == Schema Information
#
# Table name: publishers
#
#  id                         :integer          not null, primary key
#  name                       :string(100)
#  address                    :string(100)
#  city                       :string(100)
#  state                      :string(50)
#  country                    :string(100)
#  phone                      :string(100)
#  url                        :string(100)
#  description                :text
#  company_contact_name_first :string(100)
#  company_contact_name_last  :string(100)
#  company_contact_phone      :string(100)
#  company_contact_email      :string(100)
#  created_at                 :datetime
#  updated_at                 :datetime
#  user_id                    :integer
#  zip                        :string(255)
#

class Publisher < ActiveRecord::Base
  
    attr_accessor :created_at, :updated_at

    # attr_accessor :id, :user_id, :created_at, :updated_at

    attr_accessible :id,
                    :user_id, 
                    :name, 
                    :address, 
                    :city, 
                    :state, 
                    :country, 
                    :zip,
                    :phone, 
                    :url, 
                    :description, 
                    :company_contact_name_first, 
                    :company_contact_name_last,
                    :company_contact_phone, 
                    :company_contact_email 
  
    belongs_to :user  

    has_one :publisher_profile
    has_one :publisher_setting
    has_one :publisher_admin_setting
    
    has_many :publisher_profile_images
    has_many :publisher_products
    has_many :journalposterpurchases
    
      
    
  def self.dbdelete
      self.connection.execute("DELETE FROM publishers")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publishers_id_seq RESTART WITH 1")
  end
    
    
end

