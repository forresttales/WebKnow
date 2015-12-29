class AlterPublisherProductTeksScienceStandards1 < ActiveRecord::Migration
  def change
    
      add_column :publisher_product_teks_science_standards, :publisher_id, :integer, :default => 0
      add_column :publisher_product_teks_science_standards, :publisher_product_id, :integer, :default => 0
      add_column :publisher_product_teks_science_standards, :id_standard, :integer, :default => 0
      add_column :publisher_product_teks_science_standards, :chapter, :integer, :default => 0
      add_column :publisher_product_teks_science_standards, :section, :integer, :default => 0
      add_column :publisher_product_teks_science_standards, :section_text, :string, :default => ""
      add_column :publisher_product_teks_science_standards, :uri, :string, :default => ""
    
  end
end
