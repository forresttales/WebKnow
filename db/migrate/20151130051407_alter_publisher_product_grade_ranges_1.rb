class AlterPublisherProductGradeRanges1 < ActiveRecord::Migration
  def change
    
      add_column :publisher_product_grade_ranges, :publisher_id, :integer
      add_column :publisher_product_grade_ranges, :publisher_product_id, :integer

      add_column :publisher_product_grade_ranges, :grade_from, :integer, :default => 0
      add_column :publisher_product_grade_ranges, :grade_to, :integer, :default => 0
    
      add_index :publisher_product_grade_ranges, :publisher_product_id, :name => 'index_grade_ranges_on_publisher_product_id'
    
  end
end
