class AlterTeksLanguagesNonEngStandards1 < ActiveRecord::Migration
  def change
    
    add_column :teks_languages_non_eng_standards, :order, :integer, :default => 0
    add_column :teks_languages_non_eng_standards, :section_text, :string, :default => ""    
    add_column :teks_languages_non_eng_standards, :chapter, :integer, :default => 0
    add_column :teks_languages_non_eng_standards, :section, :integer, :default => 0
    add_column :teks_languages_non_eng_standards, :uri, :string, :default => ""
    
  end
end
