# == Schema Information
#
# Table name: issued_gen_ids
#
#  id                  :integer          not null, primary key
#  created_at          :datetime
#  updated_at          :datetime
#  profile_type        :integer          default(0)
#  profile_id          :integer          default(0)
#  has_personalized_id :boolean          default(FALSE)
#  personalized_id     :string(255)
#  gen_id              :integer
#  user_id             :integer
#  student_id          :integer
#  teacher_id          :integer
#  publisher_id        :integer
#  institute_id        :integer
#  recruiter_id        :integer
#

class IssuedGenId < ActiveRecord::Base

  attr_accessible :gen_id,
                  :profile_type,
                  :profile_id,
                  :user_id,
                  :student_id,
                  :teacher_id,
                  :publisher_id,
                  :institute_id,
                  :recruiter_id,
                  :has_personalized_id,
                  :personalized_id

  
  belongs_to :user
  belongs_to :publisher

  
  def self.dbdelete
      self.connection.execute("DELETE FROM issued_gen_ids")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE issued_gen_ids_id_seq RESTART WITH 1")
  end

  
end
