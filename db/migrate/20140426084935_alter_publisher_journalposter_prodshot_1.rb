class AlterPublisherJournalposterProdshot1 < ActiveRecord::Migration
  def change
    
      add_index("publisher_journalposter_prodshots", "publisher_journalposter_id", :unique => true, :name => 'publisher_id_journalposter_prodshot_id')
    
  end
end
