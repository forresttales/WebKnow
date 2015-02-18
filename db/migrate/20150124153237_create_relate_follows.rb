class CreateRelateFollows < ActiveRecord::Migration
  def change
    create_table :relate_follows do |t|

      t.timestamps
    end
  end
end
