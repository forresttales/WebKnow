class AlterPublisherProducts3 < ActiveRecord::Migration
  def change
    
    add_column :publisher_products, :has_required_1, :boolean, :default => false
    add_column :publisher_products, :has_required_2, :boolean, :default => false
    add_column :publisher_products, :has_required_3, :boolean, :default => false
    add_column :publisher_products, :has_required_4, :boolean, :default => false
    add_column :publisher_products, :is_edited_1, :boolean, :default => false
    add_column :publisher_products, :is_edited_2, :boolean, :default => false
    
  end
end
