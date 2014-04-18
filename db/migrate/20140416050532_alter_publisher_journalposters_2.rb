class AlterPublisherJournalposters2 < ActiveRecord::Migration
  def change
    
      add_column :publisher_journalposters, :poster, :integer    
      add_column :publisher_journalposters, :poster_text, :string, :limit => 255    
    
  end
end
