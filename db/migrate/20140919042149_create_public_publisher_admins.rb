class CreatePublicPublisherAdmins < ActiveRecord::Migration
  def change
    create_table :public_publisher_admins do |t|

      t.timestamps
    end
  end
end
