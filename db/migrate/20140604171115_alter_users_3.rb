class AlterUsers3 < ActiveRecord::Migration
  def change
    
      remove_column("users", "account_type_int")    
      remove_column("users", "account_type")    

      add_column :users, :account_type, :integer, :default => 0    
      add_column :users, :account_type_text, :string, :limit => 255    
    
  end
end
