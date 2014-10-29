# == Schema Information
#
# Table name: publisher_poster_premium_positions
#
#  id                   :integer          not null, primary key
#  publisher_id         :integer
#  publisher_product_id :integer
#  created_at           :datetime
#  updated_at           :datetime
#

class PublisherPosterPremiumPosition < ActiveRecord::Base
end
