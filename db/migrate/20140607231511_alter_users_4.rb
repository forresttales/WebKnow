class AlterUsers4 < ActiveRecord::Migration
  def change

      add_column :users, :bd_month_text, :string, :limit => 255    
      add_column :users, :gender_text, :string, :limit => 255    
    
  end
end
