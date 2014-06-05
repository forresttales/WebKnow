class CreateJournal4posters < ActiveRecord::Migration
  def change
    create_table :journal4posters do |t|

      t.integer "id_user"
      t.integer "publisher_id"
      t.integer "publisher_journalposter_id"
      t.integer "map_position", :default => 0
      t.integer "id_final"
      t.string "url", :limit => 255
      t.string "main_sales_phone", :limit => 255
      
      t.timestamps
    end
    
    add_index("journal4posters", "publisher_id")
    add_index("journal4posters", "publisher_journalposter_id")
    
  end
  
end
