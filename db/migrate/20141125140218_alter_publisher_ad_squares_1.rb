class AlterPublisherAdSquares1 < ActiveRecord::Migration
  def change
    
      add_column :publisher_ad_squares, :user_id, :integer, :default => 0
      add_column :publisher_ad_squares, :publisher_id, :integer, :default => 0
      add_column :publisher_ad_squares, :publisher_product_id, :integer, :default => 0
      
      add_column :publisher_ad_squares, :ad_amount, :decimal, precision: 8, scale: 2, :default => 0.00

      add_column :publisher_ad_squares, :name_product, :string

      add_column :publisher_ad_squares, :poster, :string
      add_column :publisher_ad_squares, :poster_index, :integer, :default => 0
      
      add_column :publisher_ad_squares, :term_square, :integer, :default => 0

      add_column :publisher_ad_squares, :keyword, :string
      add_column :publisher_ad_squares, :cost_keyword, :decimal, precision: 8, scale: 2, :default => 0.00

      add_column :publisher_ad_squares, :ad_date_exp, :datetime
      add_column :publisher_ad_squares, :ad_date_init, :datetime

      add_index("publisher_ad_squares", "publisher_id")

    
  end
end
