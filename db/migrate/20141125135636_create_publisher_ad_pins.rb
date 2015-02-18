class CreatePublisherAdPins < ActiveRecord::Migration
  def change
    create_table :publisher_ad_pins do |t|

      t.timestamps
    end
  end
end
