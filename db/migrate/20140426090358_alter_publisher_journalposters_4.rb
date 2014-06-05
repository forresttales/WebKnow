class AlterPublisherJournalposters4 < ActiveRecord::Migration
  def change
    
      remove_column("publisher_journalposters", "has_product_shot")

      add_column :publisher_journalposters, :has_journalposter_prodshot, :boolean    
    
  end
end
