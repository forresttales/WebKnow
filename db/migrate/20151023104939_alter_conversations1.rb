class AlterConversations1 < ActiveRecord::Migration
  def change
	add_column :conversations, :dialog_id, :integer, :default => 0
	add_column :conversations, :user_id, :integer, :default => 0
	add_column :conversations, :start_from_message_id, :integer, :default => 0
	add_column :conversations, :owner, :boolean, :default => false
  end
end
