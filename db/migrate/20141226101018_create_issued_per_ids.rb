class CreateIssuedPerIds < ActiveRecord::Migration
  def change
    create_table :issued_per_ids do |t|

      t.timestamps
    end
  end
end
