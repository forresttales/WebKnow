# == Schema Information
#
# Table name: messages
#
#  id           			:integer          not null, primary key
#  conversation_id 			:integer		  default(0)
#  user_id    				:integer		  default(0)
#  body						:string 		  default(0)
#  created_at   			:datetime
#  updated_at   			:datetime
#
class Message < ActiveRecord::Base
	attr_accessible :id,
					:dialog_id,
					:user_id,
					:body,
					:created_at,
					:updated_at

	belongs_to :conversation
	belongs_to :user
end
