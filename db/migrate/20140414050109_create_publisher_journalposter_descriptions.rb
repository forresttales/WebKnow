class CreatePublisherJournalposterDescriptions < ActiveRecord::Migration
  def change
    create_table :publisher_journalposter_descriptions do |t|

      t.integer "publisher_journalposter_id"
      t.integer "publisher_id"

      t.timestamps
    end
  end
end

