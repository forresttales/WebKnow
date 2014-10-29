class CreatePublisherMembers < ActiveRecord::Migration
  def change
    create_table :publisher_members do |t|

      t.timestamps
    end
  end
end
