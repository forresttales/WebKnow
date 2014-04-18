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
#  zip                        :integer
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
#

class Publisher < ActiveRecord::Base
  
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
                    :company_contact_email, 
                    :created_at, 
                    :updated_at
  
    belongs_to :user  
    
    has_many :publisher_images
    has_many :publisher_profiles
    has_many :publisher_settings
    has_many :publisher_products
    has_many :journalposterpurchases
      
    
    
end

