# == Schema Information
#
# Table name: publisher_product_characters
#
#  id                   :integer          not null, primary key
#  publisher_id         :integer
#  publisher_product_id :integer
#  character_1          :boolean          default(FALSE)
#  character_2          :boolean          default(FALSE)
#  character_3          :boolean          default(FALSE)
#  character_4          :boolean          default(FALSE)
#  character_5          :boolean          default(FALSE)
#  character_6          :boolean          default(FALSE)
#  character_7          :boolean          default(FALSE)
#  character_8          :boolean          default(FALSE)
#  character_9          :boolean          default(FALSE)
#  character_10         :boolean          default(FALSE)
#  created_at           :datetime
#  updated_at           :datetime
#

class PublisherProductCharacter < ActiveRecord::Base

  attr_accessible :publisher_id,
                  :publisher_product_id,
                  :publisher_product_description_id,
                  :character_1,
                  :character_2,
                  :character_3,
                  :character_4,
                  :character_5,
                  :character_6,
                  :character_7,
                  :character_8,
                  :character_9,
                  :character_10,
                  :created_at,
                  :updated_at




  belongs_to :publisher_product


  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_product_characters")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_product_characters_id_seq RESTART WITH 1")
  end


end
