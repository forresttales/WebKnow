class AlterTeksPhysicalEdStandards1 < ActiveRecord::Migration
  def change
    
    add_column :teks_physical_ed_standards, :order, :integer, :default => 0
    add_column :teks_physical_ed_standards, :section_text, :string, :default => ""    
    add_column :teks_physical_ed_standards, :chapter, :integer, :default => 0
    add_column :teks_physical_ed_standards, :section, :integer, :default => 0
    add_column :teks_physical_ed_standards, :uri, :string, :default => ""
    
  end
end
