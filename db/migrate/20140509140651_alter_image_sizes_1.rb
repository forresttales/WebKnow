class AlterImageSizes1 < ActiveRecord::Migration
  def change
    
      add_column :image_sizes, :name, :string, :limit => 255    
    
  end
end
