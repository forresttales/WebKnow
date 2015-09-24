class AlterLogErrors3 < ActiveRecord::Migration
  def change
    add_column :log_errors, :user_id, :integer
  end
end
