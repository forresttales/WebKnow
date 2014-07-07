class CreateUserGroups < ActiveRecord::Migration
  def change
    create_table :user_groups do |t|
      t.integer "user_id"
      t.string "name_group"

      t.timestamps
    end
      add_index("user_groups", "user_id")
  end
end
