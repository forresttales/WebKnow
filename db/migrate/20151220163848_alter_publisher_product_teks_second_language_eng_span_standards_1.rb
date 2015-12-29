class AlterPublisherProductTeksSecondLanguageEngSpanStandards1 < ActiveRecord::Migration
  def change
    
      add_column :publisher_product_teks_second_language_eng_span_standards, :publisher_id, :integer, :default => 0
      add_column :publisher_product_teks_second_language_eng_span_standards, :publisher_product_id, :integer, :default => 0
      add_column :publisher_product_teks_second_language_eng_span_standards, :id_standard, :integer, :default => 0
      add_column :publisher_product_teks_second_language_eng_span_standards, :chapter, :integer, :default => 0
      add_column :publisher_product_teks_second_language_eng_span_standards, :section, :integer, :default => 0
      add_column :publisher_product_teks_second_language_eng_span_standards, :section_text, :string, :default => ""
      add_column :publisher_product_teks_second_language_eng_span_standards, :uri, :string, :default => ""
    
  end
end
