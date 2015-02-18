class AlterIssuedGenIds3 < ActiveRecord::Migration
  def change
    
    add_column :issued_gen_ids, :has_personalized_id, :boolean, :default => false
    add_column :issued_gen_ids, :personalized_id, :string
    
  end
end
