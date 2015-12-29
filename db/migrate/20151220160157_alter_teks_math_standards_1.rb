class AlterTeksMathStandards1 < ActiveRecord::Migration
  def change
    
    add_column :teks_math_standards, :order, :integer, :default => 0
    add_column :teks_math_standards, :section_text, :string, :default => ""    
    add_column :teks_math_standards, :chapter, :integer, :default => 0
    add_column :teks_math_standards, :section, :integer, :default => 0
    add_column :teks_math_standards, :uri, :string, :default => ""
    
  end
end
