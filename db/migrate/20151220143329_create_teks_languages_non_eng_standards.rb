class CreateTeksLanguagesNonEngStandards < ActiveRecord::Migration
  def change
    create_table :teks_languages_non_eng_standards do |t|

      t.timestamps
    end
  end
end
