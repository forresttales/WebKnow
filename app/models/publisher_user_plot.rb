# == Schema Information
#
# Table name: publisher_user_plots
#
#  id                :integer          not null, primary key
#  created_at        :datetime
#  updated_at        :datetime
#  publisher_user_id :integer
#  publisher_id      :integer
#  user_id           :integer
#  plot_text         :text             default("")
#

class PublisherUserPlot < ActiveRecord::Base
  
  attr_accessible :publisher_user_id,
                  :publisher_id,
                  :user_id,
                  :plot_text
                  
                  
  belongs_to :publisher_user
  has_many :publisher_user_plot_images, dependent: :destroy
  
  
  
  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_user_plots")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_user_plots_id_seq RESTART WITH 1")
  end

  
end
