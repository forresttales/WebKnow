class AlterTeksSocialStudiesStandards1 < ActiveRecord::Migration
  def change
    
    add_column :teks_social_studies_standards, :order, :integer, :default => 0
    add_column :teks_social_studies_standards, :section_text, :string, :default => ""    
    add_column :teks_social_studies_standards, :chapter, :integer, :default => 0
    add_column :teks_social_studies_standards, :section, :integer, :default => 0
    add_column :teks_social_studies_standards, :uri, :string, :default => ""
    
  end
end