class AlterPublisherJournalposterDescriptions2 < ActiveRecord::Migration
  def change
    
      remove_column("publisher_journalposter_descriptions", "word_descr")

      add_column :publisher_journalposter_descriptions, :word_descr, :text    
      add_column :publisher_journalposter_descriptions, :url, :string, :limit => 255    
    
  end
end
