class Message < ActiveRecord::Base
  
# == Schema Information
#
# Table name: messages
#
#  id              :integer          not null, primary key
#  created_at      :datetime
#  updated_at      :datetime
#  user_id         :integer          default(0)
#  body            :text
#  unread          :boolean          default(TRUE)
#  dialog_id       :integer          default(0)
#  conversation_id :integer          default(0)
#

    attr_accessible :conversation_id,
                    :dialog_id,
                    :user_id,
                    :body,
                    :unread
  
    belongs_to :conversation, foreign_key: "dialog_id", :primary_key => 'dialog_id'
    belongs_to :user

  
end
