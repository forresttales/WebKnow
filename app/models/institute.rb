# == Schema Information
#
# Table name: institutes
#
#  id                         :integer          not null, primary key
#  name                       :string(100)
#  address                    :string(100)
#  city                       :string(100)
#  state                      :string(50)
#  country                    :string(100)
#  zip                        :integer
#  main_phone                 :string(100)
#  main_contact_email         :string(100)
#  public_private             :string(10)
#  number_students            :integer
#  number_computing_devices   :integer
#  post_rfp_link              :string(100)
#  company_contact_name_first :string(100)
#  company_contact_name_last  :string(100)
#  name_title                 :string(50)
#  company_contact_phone      :string(50)
#  company_contact_email      :string(100)
#  allow_add_products         :boolean
#  created_at                 :datetime
#  updated_at                 :datetime
#  user_id                    :integer
#

class Institute < ActiveRecord::Base
  
    attr_accessible :id, 
                    :user_id,    
                    :name, 
                    :address, 
                    :city, 
                    :state, 
                    :country, 
                    :zip, 
                    :main_phone, 
                    :main_contact_email, 
                    :public_private, 
                    :number_students, 
                    :number_computing_devices, 
                    :post_rfp_link, 
                    :company_contact_name_first, 
                    :company_contact_name_last, 
                    :name_title, 
                    :company_contact_phone, 
                    :company_contact_email, 
                    :allow_add_products,        
                    :created_at, 
                    :updated_at            
     
    belongs_to :user  
    
    has_many :institute_images
    has_many :institute_profiles
    has_many :institute_settings
    has_many :institute_products


    
end
