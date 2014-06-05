class AlterPublisherJournalposters3 < ActiveRecord::Migration
  def change

      add_column :publisher_journalposters, :has_product_shot, :boolean    

      add_index("publisher_journalposters", "publisher_id")

  end
end
