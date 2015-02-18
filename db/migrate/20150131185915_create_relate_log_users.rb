class CreateRelateLogUsers < ActiveRecord::Migration
  def change
    create_table :relate_log_users do |t|

      t.timestamps
    end
  end
end
