class AlterTeksFineArtsStandards1 < ActiveRecord::Migration
  def change
    
    add_column :teks_fine_arts_standards, :order, :integer, :default => 0
    add_column :teks_fine_arts_standards, :section_text, :string, :default => ""    
    add_column :teks_fine_arts_standards, :chapter, :integer, :default => 0
    add_column :teks_fine_arts_standards, :section, :integer, :default => 0
    add_column :teks_fine_arts_standards, :uri, :string, :default => ""
    
  end
end
