class AlterPublisherJournalposters7 < ActiveRecord::Migration
  def change

      add_column :publisher_journalposters, :poster_type, :integer, :default => 0    
      add_column :publisher_journalposters, :poster_coord_id, :integer, :default => 0    

  end
end

  # :poster_type, #integer 1 to 5
  # :poster_coord_id,
