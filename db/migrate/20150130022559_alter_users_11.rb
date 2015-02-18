class AlterUsers11 < ActiveRecord::Migration
  def change
    
    remove_column :users, :account_type
    remove_column :users, :account_type_text
    
    add_column :users, :profile_type, :integer, :default => 0
    add_column :users, :profile_type_text, :string
    
  end
end
