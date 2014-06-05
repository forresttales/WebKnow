class AlterPublisherJournalposters9 < ActiveRecord::Migration
  def change
    
      add_column :publisher_journalposters, :area, :integer, :default => 0    
      add_column :publisher_journalposters, :area_pos, :integer, :default => 0    
    
  end
end

  # area
  # area_pos
