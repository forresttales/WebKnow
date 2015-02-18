class AlterIssuedGenIds1 < ActiveRecord::Migration
  def change
    
    add_column :issued_gen_ids, :id_gen, :integer
    add_index :issued_gen_ids, :id_gen, unique: true
    
  end
end
