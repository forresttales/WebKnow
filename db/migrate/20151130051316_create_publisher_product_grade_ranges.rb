class CreatePublisherProductGradeRanges < ActiveRecord::Migration
  def change
    create_table :publisher_product_grade_ranges do |t|

      t.timestamps
    end
  end
end
