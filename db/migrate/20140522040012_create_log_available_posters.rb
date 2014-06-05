class CreateLogAvailablePosters < ActiveRecord::Migration
  def change
    create_table :log_available_posters do |t|

      t.integer "id_map"
      t.boolean "closed", :default => false

      t.timestamps
    end
  end
end
