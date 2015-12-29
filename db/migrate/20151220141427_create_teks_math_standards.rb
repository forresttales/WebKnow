class CreateTeksMathStandards < ActiveRecord::Migration
  def change
    create_table :teks_math_standards do |t|

      t.timestamps
    end
  end
end
