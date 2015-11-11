class Conversation < ActiveRecord::Base
  
# == Schema Information
#
# Table name: conversations
#
#  id                    :integer          not null, primary key
#  created_at            :datetime
#  updated_at            :datetime
#  dialog_id             :integer          default(0)
#  user_id               :integer          default(0)
#  start_from_message_id :integer          default(0)
#  owner                 :boolean          default(FALSE)
#

  
    attr_accessible :dialog_id,
                    :user_id,
                    :start_from_message_id,
                    :owner
  
    has_many :messages, foreign_key: "dialog_id", :primary_key => 'dialog_id'
    belongs_to :user
    
    
  
end
