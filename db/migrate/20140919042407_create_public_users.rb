class CreatePublicUsers < ActiveRecord::Migration
  def change
    create_table :public_users do |t|

      t.timestamps
    end
  end
end
