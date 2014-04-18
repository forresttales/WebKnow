class AlterJournalposterpurchase2 < ActiveRecord::Migration
  def change
    
      add_column :journalposterpurchases, :poster_1, :integer    
      add_column :journalposterpurchases, :poster_1_text, :string, :limit => 255    

      add_column :journalposterpurchases, :poster_2, :integer    
      add_column :journalposterpurchases, :poster_2_text, :string, :limit => 255    

      add_column :journalposterpurchases, :poster_3, :integer    
      add_column :journalposterpurchases, :poster_3_text, :string, :limit => 255    

      add_column :journalposterpurchases, :poster_4, :integer    
      add_column :journalposterpurchases, :poster_4_text, :string, :limit => 255    
    
  end
end
