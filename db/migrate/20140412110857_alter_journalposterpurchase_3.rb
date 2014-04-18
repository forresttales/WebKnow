class AlterJournalposterpurchase3 < ActiveRecord::Migration
  def change
    
    remove_column("journalposterpurchases", "poster_1")
    remove_column("journalposterpurchases", "poster_1_text")
    remove_column("journalposterpurchases", "poster_2")
    remove_column("journalposterpurchases", "poster_2_text")
    remove_column("journalposterpurchases", "poster_3")
    remove_column("journalposterpurchases", "poster_3_text")
    remove_column("journalposterpurchases", "poster_4")
    remove_column("journalposterpurchases", "poster_4_text")
    
    add_column :journalposterpurchases, :poster, :integer    
    add_column :journalposterpurchases, :poster_text, :string, :limit => 255    
    
  end
end
