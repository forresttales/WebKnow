class AlterJournal2posters1 < ActiveRecord::Migration
  def change
    
      remove_column("journal2posters", "id_final")    
      remove_column("journal2posters", "map_position")    

      add_column :journal2posters, :pos_map, :integer, :default => 0    

      remove_index("journal2posters", "publisher_id")
    
  end
end
