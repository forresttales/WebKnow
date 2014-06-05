class AlterUsers1 < ActiveRecord::Migration
  def change
    
      add_column :users, :bd_day, :integer, :default => 0    
      add_column :users, :bd_month, :integer, :default => 0    
      add_column :users, :bd_year, :integer, :default => 0    
      add_column :users, :gender, :integer, :default => 0    
          
  end
end
