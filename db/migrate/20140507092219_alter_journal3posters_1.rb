class AlterJournal3posters1 < ActiveRecord::Migration
  def change
    
      remove_column("journal3posters", "id_final")    
      remove_column("journal3posters", "map_position")    

      add_column :journal3posters, :pos_map, :integer, :default => 0    

      remove_index("journal3posters", "publisher_id")
    
  end
end
