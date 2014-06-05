class CreateImageIdents < ActiveRecord::Migration
  def change
    create_table :image_idents do |t|
      t.string "assigned_text", :limit => 255
      t.integer "assigned_digit"

      t.timestamps
    end
  end
end
