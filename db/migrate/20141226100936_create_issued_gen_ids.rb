class CreateIssuedGenIds < ActiveRecord::Migration
  def change
    create_table :issued_gen_ids do |t|

      t.timestamps
    end
  end
end
