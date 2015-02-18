class AlterLogErrors1 < ActiveRecord::Migration
  def change
    
    add_column :log_errors, :profile_index, :integer, :default => 0
    add_column :log_errors, :profile_description, :string
    add_column :log_errors, :method, :string
    add_column :log_errors, :description, :string
    
  end
end

  # student   1
  # teacher   2
  # publisher 3
  # institute 4
  # recruiter  5
