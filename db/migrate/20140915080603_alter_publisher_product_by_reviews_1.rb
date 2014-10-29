class AlterPublisherProductByReviews1 < ActiveRecord::Migration
  def change

    remove_column("publisher_product_by_reviews", "by_review_other_text")
    remove_column("publisher_product_by_reviews", "by_review_other")
    
    add_column :publisher_product_by_reviews, :by_review_other_b, :boolean, :default => false
    add_column :publisher_product_by_reviews, :by_review_other, :string
        
  end
end
