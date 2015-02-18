class CreateRelatePublisherFollows < ActiveRecord::Migration
  def change
    create_table :relate_publisher_follows do |t|

      t.timestamps
    end
  end
end
