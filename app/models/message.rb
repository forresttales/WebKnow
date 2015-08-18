class Message < ActiveRecord::Base

	attr_accessible :user_id,
					:body

  	belongs_to :user

end
