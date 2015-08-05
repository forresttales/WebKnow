class CreatePublisherLogoBkgrndImages < ActiveRecord::Migration
  def change
    create_table :publisher_logo_bkgrnd_images do |t|

      t.timestamps
    end
  end
end
