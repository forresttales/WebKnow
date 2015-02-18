class AlterPublishers3 < ActiveRecord::Migration
  def change
    
    remove_column :publishers, :name
    remove_column :publishers, :address
    remove_column :publishers, :phone
    remove_column :publishers, :url
    remove_column :publishers, :description
    remove_column :publishers, :company_contact_name_first
    remove_column :publishers, :company_contact_name_last
    remove_column :publishers, :company_contact_phone
    remove_column :publishers, :company_contact_email

    add_column :publishers, :name_company, :string
    add_column :publishers, :address1, :string
    add_column :publishers, :address2, :string
    add_column :publishers, :website, :string
    add_column :publishers, :phone_company, :string
    add_column :publishers, :email_info, :string
    add_column :publishers, :email_admin, :string
    add_column :publishers, :name_admin, :string
    add_column :publishers, :story_corporate, :text
    add_column :publishers, :tagline_logo, :string
        
  end
end


  # :name, 
  # :address, 
  # :city, 
  # :state, 
  # :country, 
  # :zip,
  # :phone, 
  # :url, 
  # :description, 
  # :company_contact_name_first, 
  # :company_contact_name_last,
  # :company_contact_phone, 
  # :company_contact_email,

  # :name_company,
  # :address1,
  # :address2,
  # :city, 
  # :state, 
  # :country, 
  # :zip,
  # :website,
  # :phone_company,
  # :email_info,
  # :contact_admin
