class CreatePublisherPosterSquares < ActiveRecord::Migration
  def change
    create_table :publisher_poster_squares do |t|

      t.integer "publisher_id"
      t.integer "publisher_product_id"
      
      t.timestamps
    end

      add_index("publisher_poster_squares", "publisher_id")
      add_index("publisher_poster_squares", "publisher_product_id")
  end
end
