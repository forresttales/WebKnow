class CreatePostUserFiles < ActiveRecord::Migration
  def change
    create_table :post_user_files do |t|

      t.timestamps
    end
  end
end
