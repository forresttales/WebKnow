class AlterPublisherJournalposters6 < ActiveRecord::Migration
  def change
    
      add_column :publisher_journalposters, :purchase_date, :timestamp    
    
  end
end
