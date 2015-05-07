# == Schema Information
#
# Table name: publisher_plots
#
#  id                :integer          not null, primary key
#  created_at        :datetime
#  updated_at        :datetime
#  publisher_id      :integer
#  publisher_user_id :integer
#  user_id           :integer
#  plot_text         :text             default("<br>")
#

class PublisherPlot < ActiveRecord::Base
  
  attr_accessible :publisher_id,
                  :publisher_user_id,
                  :user_id,
                  :plot_text
                  
                  
  belongs_to :publisher
  has_many :publisher_plot_images, dependent: :destroy
  
  
  
  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_plots")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_plots_id_seq RESTART WITH 1")
  end

  
end
