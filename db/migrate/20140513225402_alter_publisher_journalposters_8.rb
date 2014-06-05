class AlterPublisherJournalposters8 < ActiveRecord::Migration
  def change

      add_column :publisher_journalposters, :id_map, :integer, :default => 0    

  end
end
