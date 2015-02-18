class CreatePostUserComments < ActiveRecord::Migration
  def change
    create_table :post_user_comments do |t|

      t.timestamps
    end
  end
end
