class CreateJournalposterpurchases < ActiveRecord::Migration
  def change
    create_table :journalposterpurchases do |t|

      t.integer "id_user"
      t.integer "id_journalposter"
      t.string "description", :limit => 255
      t.integer "price"
      
      t.timestamps
    end
  end
end
