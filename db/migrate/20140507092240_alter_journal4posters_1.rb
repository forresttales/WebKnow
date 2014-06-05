class AlterJournal4posters1 < ActiveRecord::Migration
  def change
    
      remove_column("journal4posters", "id_final")    
      remove_column("journal4posters", "map_position")    

      add_column :journal4posters, :pos_map, :integer, :default => 0    

      remove_index("journal4posters", "publisher_id")
    
  end
end
