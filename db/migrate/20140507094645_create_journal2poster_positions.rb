class CreateJournal2posterPositions < ActiveRecord::Migration
  def change
    create_table :journal2poster_positions do |t|

      t.integer "id_map"
      t.integer "pos_map", :default => 0
      t.integer "pos_x", :default => 0
      t.integer "pos_y", :default => 0

      t.timestamps
    end
    
    add_index("journal2poster_positions", "id_map")
    
  end
end
