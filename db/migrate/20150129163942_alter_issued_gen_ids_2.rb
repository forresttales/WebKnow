class AlterIssuedGenIds2 < ActiveRecord::Migration
  def change
    
    add_column :issued_gen_ids, :profile_type, :integer, :default => 0
    add_column :issued_gen_ids, :profile_id, :integer, :default => 0
        
  end
end
