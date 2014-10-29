# == Schema Information
#
# Table name: publisher_poster_pins
#
#  id                   :integer          not null, primary key
#  publisher_id         :integer
#  publisher_product_id :integer
#  created_at           :datetime
#  updated_at           :datetime
#

class PublisherPosterPin < ActiveRecord::Base
end
