class AlterPublisherJournalposterLogos1 < ActiveRecord::Migration
  def change
    
      add_index("publisher_journalposter_logos", "publisher_journalposter_id", :unique => true, :name => 'publisher_id_journalposter_logo_id')
    
  end
end
