# == Schema Information
#
# Table name: messages
#
#  id           			:integer          not null, primary key
#  conversation_id 			:integer		  default(0)
#  user_id    				:integer		  default(0)
#  body						:text		  	  default(0)
#  unread					:boolean		  default(true)
#  created_at   			:datetime
#  updated_at   			:datetime
#
class Message < ActiveRecord::Base
	attr_accessible :id,
					:dialog_id,
					:user_id,
					:body,
					:unread,
					:created_at,
					:updated_at

	belongs_to :conversation, foreign_key: "dialog_id"
	belongs_to :users
end
