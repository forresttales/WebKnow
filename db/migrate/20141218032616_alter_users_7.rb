class AlterUsers7 < ActiveRecord::Migration
  def change
    
    add_column :users, :id_gen, :integer, :default => 0
    add_column :users, :id_per, :string, :default => ""
        
  end
end
