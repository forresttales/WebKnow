class CreateLogUsers < ActiveRecord::Migration
  def change
    create_table :log_users do |t|

      t.timestamps
    end
  end
end
