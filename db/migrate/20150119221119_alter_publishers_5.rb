class AlterPublishers5 < ActiveRecord::Migration
  def change
    
    remove_column :publishers, :story_corporate

    add_column :publishers, :story_corporate, :text, :default => ""
    
  end
end
