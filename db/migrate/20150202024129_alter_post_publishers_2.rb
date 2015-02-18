class AlterPostPublishers2 < ActiveRecord::Migration
  def change
    
    add_column :post_publishers, :b_group, :boolean, :default => false
    
  end
end
