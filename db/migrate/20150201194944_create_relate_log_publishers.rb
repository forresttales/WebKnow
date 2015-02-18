class CreateRelateLogPublishers < ActiveRecord::Migration
  def change
    create_table :relate_log_publishers do |t|

      t.timestamps
    end
  end
end
