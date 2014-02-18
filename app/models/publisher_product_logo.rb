# == Schema Information
#
# Table name: publisher_product_logos
#
#  id                   :integer          not null, primary key
#  publisher_id         :integer
#  publisher_product_id :integer
#  image_name           :string(100)
#  created_at           :datetime
#  updated_at           :datetime
#

class PublisherProductLogo < ActiveRecord::Base
  
  attr_accessible :id,
                  :publisher_id,
                  :publisher_product_id,
                  :image_name,
                  :created_at,
                  :updated_at 
  
  
  belongs_to :publisher_product
  
end
