class CreatePublisherJournalposterImages < ActiveRecord::Migration
  def change
    create_table :publisher_journalposter_images do |t|

      t.integer "publisher_id"
      t.integer "publisher_journalposter_id"
      t.string "image"

      t.timestamps
    end
  end
end
