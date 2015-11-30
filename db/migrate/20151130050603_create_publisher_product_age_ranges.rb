class CreatePublisherProductAgeRanges < ActiveRecord::Migration
  def change
    create_table :publisher_product_age_ranges do |t|

      t.timestamps
    end
  end
end
