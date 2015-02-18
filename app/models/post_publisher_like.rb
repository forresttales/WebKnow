# == Schema Information
#
# Table name: post_publisher_likes
#
#  id                :integer          not null, primary key
#  created_at        :datetime
#  updated_at        :datetime
#  post_publisher_id :integer
#  user_id           :integer
#

class PostPublisherLike < ActiveRecord::Base
end
