class CreatePostUserLikes < ActiveRecord::Migration
  def change
    create_table :post_user_likes do |t|

      t.timestamps
    end
  end
end
