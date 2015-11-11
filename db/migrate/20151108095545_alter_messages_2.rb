class AlterMessages2 < ActiveRecord::Migration
  def change
    
    add_column :messages, :conversation_id, :integer, :default => 0
    
  end
end
