class AlterPublishers2 < ActiveRecord::Migration
  def change
    
    add_column :publishers, :slug, :string
    add_index :publishers, :slug, unique: true
    
  end
end
