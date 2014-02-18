# == Schema Information
#
# Table name: publisher_product_metadatatags
#
#  id                   :integer          not null, primary key
#  publisher_id         :integer
#  publisher_product_id :integer
#  created_at           :datetime
#  updated_at           :datetime
#  name_metadata        :string(100)
#  text_metadata        :text
#

class PublisherProductMetadatatag < ActiveRecord::Base
  
  attr_accessible :id,
                  :publisher_id,
                  :publisher_product_id,
                  :name_metadata,
                  :text_metadata,
                  :created_at,
                  :updated_at 
  
  
  belongs_to :publisher_product
  
end

    # remove_column("publisher_product_descriptions", "word_description")
#     
    # add_column :publisher_product_descriptions, :name_product, :string, :limit => 100    
