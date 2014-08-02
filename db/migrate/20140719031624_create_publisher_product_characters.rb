class CreatePublisherProductCharacters < ActiveRecord::Migration
  def change
    create_table :publisher_product_characters do |t|

      t.integer "publisher_id"
      t.integer "publisher_product_id"
      t.integer "publisher_product_description_id"
      t.boolean "character_1", :default => false
      t.boolean "character_2", :default => false
      t.boolean "character_3", :default => false
      t.boolean "character_4", :default => false
      t.boolean "character_5", :default => false
      t.boolean "character_6", :default => false
      t.boolean "character_7", :default => false
      t.boolean "character_8", :default => false
      t.boolean "character_9", :default => false
      t.boolean "character_10", :default => false

      t.timestamps
    end

    add_index :publisher_product_characters, :publisher_id, :name => 'index_character_on_publisher_id'
    add_index :publisher_product_characters, :publisher_product_id, :name => 'index_character_on_publisher_product_id'

  end
end
