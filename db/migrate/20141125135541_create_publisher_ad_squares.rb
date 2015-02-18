class CreatePublisherAdSquares < ActiveRecord::Migration
  def change
    create_table :publisher_ad_squares do |t|

      t.timestamps
    end
  end
end
