class CreatePublisherUsers < ActiveRecord::Migration
  def change
    create_table :publisher_users do |t|

      t.timestamps
    end
  end
end
