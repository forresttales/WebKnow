class AlterJournal5posters1 < ActiveRecord::Migration
  def change
    
      remove_column("journal5posters", "id_final")    
      remove_column("journal5posters", "map_position")    

      add_column :journal5posters, :pos_map, :integer, :default => 0    

      remove_index("journal5posters", "publisher_id")
    
  end
end
