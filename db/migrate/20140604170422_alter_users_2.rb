class AlterUsers2 < ActiveRecord::Migration
  def change
    
      add_column :users, :account_type_int, :integer, :default => 0    
    
  end
end
