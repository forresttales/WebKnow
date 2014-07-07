class CreateUserMessages < ActiveRecord::Migration
  def change
    create_table :user_messages do |t|
      t.integer "user_id"
      t.integer "sender_id"

      t.timestamps
    end
      add_index("user_messages", "user_id")
      add_index("user_messages", "sender_id")
  end
end
