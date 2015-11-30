class AlterPublisherProductGradeRanges2 < ActiveRecord::Migration
  def change
    
    add_column :publisher_product_grade_ranges, :required, :boolean, :default => false
        
  end
end
