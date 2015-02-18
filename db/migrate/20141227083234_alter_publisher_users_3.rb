class AlterPublisherUsers3 < ActiveRecord::Migration
  def change
    
    add_column :publisher_users, :slug, :string
    add_index :publisher_users, :slug, unique: true
    
  end
end
