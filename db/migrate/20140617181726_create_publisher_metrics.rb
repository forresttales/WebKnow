class CreatePublisherMetrics < ActiveRecord::Migration
  def change
    create_table :publisher_metrics do |t|
      t.integer "user_id"
      t.string "name_metric"

      t.timestamps
    end
      add_index("publisher_metrics", "user_id")
  end
end
