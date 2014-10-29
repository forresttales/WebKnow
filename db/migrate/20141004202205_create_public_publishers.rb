class CreatePublicPublishers < ActiveRecord::Migration
  def change
    create_table :public_publishers do |t|

      t.timestamps
    end
  end
end
