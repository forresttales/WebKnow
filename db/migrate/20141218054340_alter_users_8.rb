class AlterUsers8 < ActiveRecord::Migration
  def change
    
    add_column :users, :slug, :string, :limit => 200
    add_index :users, :slug, unique: true
    
  end
end
