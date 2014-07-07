# == Schema Information
#
# Table name: publisher_metrics
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  name_metric :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class PublisherMetric < ActiveRecord::Base
end
