# == Schema Information
#
# Table name: publisher_product_currents
#
#  id                               :integer          not null, primary key
#  created_at                       :datetime
#  updated_at                       :datetime
#  publisher_id                     :integer
#  user_id                          :integer
#  current_publisher_product_id     :integer          default(0)
#  current_publisher_product_gen_id :integer          default(0)
#

class PublisherProductCurrent < ActiveRecord::Base

    attr_accessible :publisher_id,
                    :user_id,
                    :current_publisher_product_id,
                    :current_publisher_product_gen_id
                    
    belongs_to :publisher
    

    def self.dbdelete
        self.connection.execute("DELETE FROM publisher_product_currents")
    end
    
    def self.dbclear
        self.connection.execute("ALTER SEQUENCE publisher_product_currents_id_seq RESTART WITH 1")
    end
                    

end
