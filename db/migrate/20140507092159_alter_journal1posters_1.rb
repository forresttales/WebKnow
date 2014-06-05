class AlterJournal1posters1 < ActiveRecord::Migration
  def change
    
      remove_column("journal1posters", "id_final")    
      remove_column("journal1posters", "map_position")    

      add_column :journal1posters, :pos_map, :integer, :default => 0    

      remove_index("journal1posters", "publisher_id")
    
  end
end
