class AlterPublisherUsers9 < ActiveRecord::Migration
  def change
    
    add_column :publisher_users, :story_plot, :text, :default => ""
    add_column :publisher_users, :story_interest, :text, :default => ""
    
  end
end
