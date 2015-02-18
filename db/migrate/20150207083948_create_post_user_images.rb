class CreatePostUserImages < ActiveRecord::Migration
  def change
    create_table :post_user_images do |t|

      t.timestamps
    end
  end
end
