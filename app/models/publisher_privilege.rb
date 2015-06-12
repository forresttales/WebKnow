# == Schema Information
#
# Table name: publisher_privileges
#
#  id                :integer          not null, primary key
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer
#  publisher_user_id :integer
#  publisher_id      :integer
#  level_1           :boolean          default(FALSE)
#  level_2           :boolean          default(FALSE)
#  level_3           :boolean          default(FALSE)
#

class PublisherPrivilege < ActiveRecord::Base
  
    attr_accessible :user_id,
                    :publisher_user_id,
                    :publisher_id,
                    :level_1,
                    :level_2,
                    :level_3
                    

    belongs_to :publisher  


    def self.dbdelete
        self.connection.execute("DELETE FROM publisher_privileges")
    end
    
    def self.dbclear
        self.connection.execute("ALTER SEQUENCE publisher_privileges_id_seq RESTART WITH 1")
    end
                    
  
end
