class CreateLogPublishers < ActiveRecord::Migration
  def change
    create_table :log_publishers do |t|

      t.timestamps
    end
  end
end
