class AlterTeksScienceStandards1 < ActiveRecord::Migration
  def change
    
    add_column :teks_science_standards, :order, :integer, :default => 0
    add_column :teks_science_standards, :section_text, :string, :default => ""    
    add_column :teks_science_standards, :chapter, :integer, :default => 0
    add_column :teks_science_standards, :section, :integer, :default => 0
    add_column :teks_science_standards, :uri, :string, :default => ""
    
  end
end
