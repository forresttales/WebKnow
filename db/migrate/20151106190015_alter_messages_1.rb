class AlterMessages1 < ActiveRecord::Migration
  def change
    
    add_column :messages, :dialog_id, :integer, :default => 0
    add_column :messages, :user_id, :integer, :default => 0
    add_column :messages, :body, :text
    add_column :messages, :unread, :boolean, :default => true
      
  end
end
