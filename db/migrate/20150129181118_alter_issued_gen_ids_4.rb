class AlterIssuedGenIds4 < ActiveRecord::Migration
  def change
    
    remove_column :issued_gen_ids, :id_gen
    add_column :issued_gen_ids, :gen_id, :bigint, :default => 0
    
  end
end
