class CreatePublisherPosters < ActiveRecord::Migration
  def change
    create_table :publisher_posters do |t|

      t.integer "publisher_id"
      t.integer "publisher_product_id"
      t.string "name_poster"
      t.boolean "has_description"
      t.boolean "has_image_logo"
      t.boolean "has_image_prodshot"
      t.boolean "poster_free"
      t.boolean "has_purchase"
      t.datetime "date_purchase"      
      t.integer "poster_type"
      t.integer "id_map"
      
      t.timestamps
    end

      add_index("publisher_posters", "publisher_id")
      add_index("publisher_posters", "publisher_product_id")
  end
end

#  id                         :integer          not null, primary key
#  publisher_id               :integer
#  name_journalposter         :string(255)
#  has_description            :boolean          default(FALSE)
#  created_at                 :datetime
#  updated_at                 :datetime
#  journalposter_logo         :string(255)
#  journalposter_metadata     :string(255)
#  poster                     :integer
#  poster_text                :string(255)
#  has_journalposter_logo     :boolean          default(FALSE)
#  has_journalposter_prodshot :boolean          default(FALSE)
#  has_journalposter_metadata :boolean          default(FALSE)
#  has_purchase               :boolean          default(FALSE)
#  purchase_date              :datetime
#  poster_type                :integer          default(0)
#  poster_coord_id            :integer          default(0)
#  id_map                     :integer          default(0)
#  area                       :integer          default(0)
#  area_pos                   :integer          default(0)

