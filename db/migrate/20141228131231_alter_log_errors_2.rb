class AlterLogErrors2 < ActiveRecord::Migration
  def change
    
    remove_column :log_errors, :method
    
    add_column :log_errors, :controller, :string
    add_column :log_errors, :action, :string

  end
end
