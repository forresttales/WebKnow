# == Schema Information
#
# Table name: publisher_user_friendships
#
#  id                :integer          not null, primary key
#  created_at        :datetime
#  updated_at        :datetime
#  user_id           :integer          default(0)
#  friend_id      	 :integer          default(0)
#  status            :string(255)      default("")
#  accepted_at       :datetime
#

class PublisherUserFriendship < ActiveRecord::Base
	attr_accessible :user_id,
					:friend_id,
					:status,		# can be 'pending', 'requested', 'accepted'
					:accepted_at


	belongs_to :user
	belongs_to :friend, :class_name => 'User'

	

	def self.request(user, friend)
		unless user == friend or PublisherUserFriendship.exists?(:user_id => user.id, :friend_id => friend.id)
			transaction do
				# user.publisher_user_friendships.build(:friend => friend, :status => 'pending')
				# friend.publisher_user_friendships.build(:friend => user, :status => 'requested')
				create(:user_id => user.id, :friend_id => friend.id, :status => 'pending')
				create(:user_id => friend.id, :friend_id => user.id, :status => 'requested')
			end
		end
	end

	def self.accept(user, friend)
		transaction do
			accepted_at = Time.now
			accept_one_side(user, friend, accepted_at)
			accept_one_side(friend, user, accepted_at)
		end
	end

	def self.accept_one_side(user, friend, accepted_at)
		request = find_by_user_id_and_friend_id(user, friend)
		request.status = 'accepted'
		request.accepted_at = accepted_at
		request.save!
	end

	def self.remove(user, friend)
		unless user == friend or !PublisherUserFriendship.exists?(:user_id => user.id, :friend_id => friend.id)
			transaction do
				remove_one_side(user, friend)
				remove_one_side(friend, user)
			end
		end
	end

	def self.remove_one_side(user, friend)
		request = find_by_user_id_and_friend_id(user, friend)
		request.destroy!
	end



	def self.dbdelete
		self.connection.execute("DELETE FROM publisher_user_friendships")
	end

	def self.dbclear
		self.connection.execute("ALTER SEQUENCE publisher_user_friendships RESTART WITH 1")
	end
end
