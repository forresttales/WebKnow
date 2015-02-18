class AlterPublishes6 < ActiveRecord::Migration
  def change

    add_column :publishers, :id_gen, :integer
    add_column :publishers, :id_per, :string, :default => ""
    add_column :publishers, :id_per_b, :boolean, :default => false
    add_column :publishers, :slug_pre_id, :string, :default => ""
    
    
  end
end

  # :id_gen,
  # :id_per,
  # :id_per_b,
  # :slug_pre_id,
