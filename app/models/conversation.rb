# == Schema Information
#
# Table name: conversations
#
#  id           			:integer          not null, primary key
#  conversation_id 			:integer		  default(0)
#  user_id    				:integer		  default(0)
#  start_from_message_id	:integer 		  default(0)         
#  owner					:boolean		  default(FALSE)
#  created_at   			:datetime
#  updated_at   			:datetime
#
class Conversation < ActiveRecord::Base

	attr_accessible :id,
					:dialog_id,
					:user_id,
					:start_from_message_id,
					:owner,
					:created_at,
					:updated_at

	has_many :messages, foreign_key: "dialog_id", :primary_key => 'dialog_id'
end
