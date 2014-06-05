class AlterPublisherJournalposterDescriptions3 < ActiveRecord::Migration
  def change
    
      add_index("publisher_journalposter_descriptions", "publisher_journalposter_id", :unique => true, :name => 'publisher_id_journalposter_id')
      
      # add_index :studies, ["user_id", "university_id", \
                          # "subject_name_id", "subject_type_id"], 
                          # :unique => true, :name => 'my_index'      
    
  end
end
