class CreatePublicPublisherUsers < ActiveRecord::Migration
  def change
    create_table :public_publisher_users do |t|

      t.timestamps
    end
  end
end
