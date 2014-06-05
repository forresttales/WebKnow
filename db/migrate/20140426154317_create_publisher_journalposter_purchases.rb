class CreatePublisherJournalposterPurchases < ActiveRecord::Migration
  def change
    create_table :publisher_journalposter_purchases do |t|

      t.integer "id_user"
      t.integer "publisher_id"
      t.integer "publisher_journalposter_id"
      t.text "message"
      t.integer "price"
      t.integer "price_owed"
      t.integer "price_paid"
      t.integer "price_refund"

      t.timestamps
    end
  end
end
