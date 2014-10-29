class AlterPublisherProductCategorySubject1 < ActiveRecord::Migration
  def change
    
    add_column :publisher_product_category_subjects, :category_subject_other_b, :boolean, :default => false
    
  end
end
