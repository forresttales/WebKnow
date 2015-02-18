class AlterPublisherUsers6 < ActiveRecord::Migration
  def change
    
    remove_column :publisher_users, :alias, :string
    
    add_column :publisher_users, :name_alias, :string
        
  end
end
