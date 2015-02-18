class AlterIssuedPerIds1 < ActiveRecord::Migration
  def change
    
    add_column :issued_per_ids, :id_per, :string
    add_index :issued_per_ids, :id_per
    
  end
end
