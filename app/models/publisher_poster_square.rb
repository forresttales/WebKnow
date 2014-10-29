# == Schema Information
#
# Table name: publisher_poster_squares
#
#  id                   :integer          not null, primary key
#  publisher_id         :integer
#  publisher_product_id :integer
#  created_at           :datetime
#  updated_at           :datetime
#

class PublisherPosterSquare < ActiveRecord::Base
end
