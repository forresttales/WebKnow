class CreateImageSizes < ActiveRecord::Migration
  def change
    create_table :image_sizes do |t|

      t.string "image", :limit => 255

      t.timestamps
    end
  end
end
