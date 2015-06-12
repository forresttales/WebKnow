class CreatePublisherPrivileges < ActiveRecord::Migration
  def change
    create_table :publisher_privileges do |t|

      t.timestamps null: false
    end
  end
end
