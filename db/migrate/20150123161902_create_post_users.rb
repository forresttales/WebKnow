class CreatePostUsers < ActiveRecord::Migration
  def change
    create_table :post_users do |t|

      t.timestamps
    end
  end
end
