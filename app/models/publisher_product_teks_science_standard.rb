# == Schema Information
#
# Table name: publisher_product_teks_science_standards
#
#  id                   :integer          not null, primary key
#  created_at           :datetime
#  updated_at           :datetime
#  publisher_id         :integer          default(0)
#  publisher_product_id :integer          default(0)
#  id_standard          :integer          default(0)
#  chapter              :integer          default(0)
#  section              :integer          default(0)
#  section_text         :string(255)      default("")
#  uri                  :string(255)      default("")
#

class PublisherProductTeksScienceStandard < ActiveRecord::Base
  
    attr_accessible :publisher_id,
                    :publisher_product_id,
                    :id_standard,
                    :chapter,
                    :section,
                    :section_text,
                    :uri



    belongs_to :publisher_product


    def self.dbdelete
        self.connection.execute("DELETE FROM publisher_product_teks_science_standards")
    end
    
    def self.dbclear
        self.connection.execute("ALTER SEQUENCE publisher_product_teks_science_standards_id_seq RESTART WITH 1")
    end
  
    def self.delete_record(publisher_product_id)
        s = "DELETE FROM publisher_product_teks_science_standards WHERE publisher_product_id=" + publisher_product_id
        self.connection.execute(s)
    end

  
end
