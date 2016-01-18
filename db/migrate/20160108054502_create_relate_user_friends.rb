class CreateRelateUserFriends < ActiveRecord::Migration
  def change
    create_table :relate_user_friends do |t|

      t.timestamps
    end
  end
end
