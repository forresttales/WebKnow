class AlterPublisherJournalposters5 < ActiveRecord::Migration
  def change

      remove_column("publisher_journalposters", "has_journalposter_logo")    
      remove_column("publisher_journalposters", "has_journalposter_prodshot")
      remove_column("publisher_journalposters", "has_journalposter_metadata")    
      remove_column("publisher_journalposters", "has_purchase")    

      add_column :publisher_journalposters, :has_journalposter_logo, :boolean, :default => false    
      add_column :publisher_journalposters, :has_journalposter_prodshot, :boolean, :default => false    
      add_column :publisher_journalposters, :has_journalposter_metadata, :boolean, :default => false    
      add_column :publisher_journalposters, :has_purchase, :boolean, :default => false    
    
  end
end
