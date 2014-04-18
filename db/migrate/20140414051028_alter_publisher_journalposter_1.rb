class AlterPublisherJournalposter1 < ActiveRecord::Migration
  def change
    
    remove_column("publisher_journalposters", "product_logo")
    remove_column("publisher_journalposters", "has_product_logo")
    remove_column("publisher_journalposters", "product_metadata")
    remove_column("publisher_journalposters", "has_product_metadata")

    add_column :publisher_journalposters, :journalposter_logo, :string, :limit => 255
    add_column :publisher_journalposters, :has_journalposter_logo, :boolean
    add_column :publisher_journalposters, :journalposter_metadata, :string, :limit => 255
    add_column :publisher_journalposters, :has_journalposter_metadata, :boolean
    add_column :publisher_journalposters, :has_purchase, :boolean
    
    
  end
end

#  product_logo         :string(255)
#  has_product_logo     :boolean          default(FALSE)
#  product_metadata     :string(255)
#  has_product_metadata :boolean          default(FALSE)
