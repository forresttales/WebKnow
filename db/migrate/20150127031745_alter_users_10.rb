class AlterUsers10 < ActiveRecord::Migration
  def change
    
    add_column :users, :slug_pre_id, :string
    add_column :users, :id_per_b, :boolean, :default => false
    
  end
end
