class CreatePublisherAdminSettings < ActiveRecord::Migration
  def change
    create_table :publisher_admin_settings do |t|
      t.integer "user_id"
      t.integer "publisher_id"
      t.string "background"
      
      t.timestamps
    end
      add_index("publisher_admin_settings", "user_id")
      add_index("publisher_admin_settings", "publisher_id")      
  end
end
