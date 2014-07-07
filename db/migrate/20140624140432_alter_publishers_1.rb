class AlterPublishers1 < ActiveRecord::Migration
  def change
      remove_column("publishers", "zip")    
      add_column :publishers, :zip, :string    
  end
end
