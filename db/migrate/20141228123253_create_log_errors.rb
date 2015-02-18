class CreateLogErrors < ActiveRecord::Migration
  def change
    create_table :log_errors do |t|

      t.timestamps
    end
  end
end
