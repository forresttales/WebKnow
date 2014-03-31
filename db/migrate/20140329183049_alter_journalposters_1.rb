class AlterJournalposters1 < ActiveRecord::Migration
  def change
    
      add_column :journalposters, :description, :string, :limit => 255    
      add_column :journalposters, :price, :integer    
    
  end
end
