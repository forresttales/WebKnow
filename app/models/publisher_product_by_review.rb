# == Schema Information
#
# Table name: publisher_product_by_reviews
#
#  id                   :integer          not null, primary key
#  publisher_id         :integer
#  publisher_product_id :integer
#  by_review_1          :boolean          default(FALSE)
#  by_review_1_text     :string(255)
#  by_review_2          :boolean          default(FALSE)
#  by_review_2_text     :string(255)
#  by_review_3          :boolean          default(FALSE)
#  by_review_3_text     :string(255)
#  by_review_4          :boolean          default(FALSE)
#  by_review_4_text     :string(255)
#  by_review_5          :boolean          default(FALSE)
#  by_review_5_text     :string(255)
#  by_review_6          :boolean          default(FALSE)
#  by_review_6_text     :string(255)
#  by_review_7          :boolean          default(FALSE)
#  by_review_7_text     :string(255)
#  by_review_8          :boolean          default(FALSE)
#  by_review_8_text     :string(255)
#  by_review_9          :boolean          default(FALSE)
#  by_review_9_text     :string(255)
#  by_review_10         :boolean          default(FALSE)
#  by_review_10_text    :string(255)
#  by_review_11         :boolean          default(FALSE)
#  by_review_11_text    :string(255)
#  by_review_12         :boolean          default(FALSE)
#  by_review_12_text    :string(255)
#  by_review_13         :boolean          default(FALSE)
#  by_review_13_text    :string(255)
#  by_review_14         :boolean          default(FALSE)
#  by_review_14_text    :string(255)
#  by_review_15         :boolean          default(FALSE)
#  by_review_15_text    :string(255)
#  by_review_16         :boolean          default(FALSE)
#  by_review_16_text    :string(255)
#  by_review_17         :boolean          default(FALSE)
#  by_review_17_text    :string(255)
#  by_review_18         :boolean          default(FALSE)
#  by_review_18_text    :string(255)
#  by_review_19         :boolean          default(FALSE)
#  by_review_19_text    :string(255)
#  by_review_20         :boolean          default(FALSE)
#  by_review_20_text    :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  by_review_other_b    :boolean          default(FALSE)
#  by_review_other      :string(255)
#

class PublisherProductByReview < ActiveRecord::Base
  
  attr_accessible :publisher_id,
                  :publisher_product_id,
                  :publisher_product_description_id,
                  :by_review_1,
                  :by_review_1_text,
                  :by_review_2,
                  :by_review_2_text,
                  :by_review_3,
                  :by_review_3_text,
                  :by_review_4,
                  :by_review_4_text,
                  :by_review_5,
                  :by_review_5_text,
                  :by_review_6,
                  :by_review_6_text,
                  :by_review_7,
                  :by_review_7_text,
                  :by_review_8,
                  :by_review_8_text,
                  :by_review_9,
                  :by_review_9_text,
                  :by_review_10,
                  :by_review_10_text,
                  :by_review_11,
                  :by_review_11_text,
                  :by_review_12,
                  :by_review_12_text,
                  :by_review_13,
                  :by_review_13_text,
                  :by_review_14,
                  :by_review_14_text,
                  :by_review_15,
                  :by_review_15_text,
                  :by_review_16,
                  :by_review_16_text,
                  :by_review_17,
                  :by_review_17_text,
                  :by_review_18,
                  :by_review_18_text,
                  :by_review_19,
                  :by_review_19_text,
                  :by_review_20,
                  :by_review_20_text,
                  :by_review_other,
                  :by_review_other_b,
                  :created_at,
                  :updated_at

  
  belongs_to :publisher_product


  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_product_by_reviews")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_product_by_reviews_id_seq RESTART WITH 1")
  end

  
end
