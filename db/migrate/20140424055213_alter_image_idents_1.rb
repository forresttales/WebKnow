class AlterImageIdents1 < ActiveRecord::Migration
  def change

    add_column :image_idents, :assigned_text_1, :string, :limit => 255
    add_column :image_idents, :assigned_text_2, :string, :limit => 255
    
  end
end
