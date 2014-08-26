# == Schema Information
#
# Table name: publisher_product_descriptions
#
#  id                     :integer          not null, primary key
#  publisher_product_id   :integer
#  publisher_id           :integer
#  created_at             :datetime
#  updated_at             :datetime
#  word_description       :text
#  name_product           :string(255)
#  description            :text
#  source_url             :string(255)
#  versions               :string(255)
#  slugged                :string(255)      default("")
#  product_tagline        :string(255)
#  topic                  :text
#  lesson_plan_subject    :text
#  updating_refresh_rate  :string(255)
#  updating_type          :string(255)
#  reselling              :boolean          default(FALSE)
#  evaluation             :string(255)
#  allow_teacher_rating   :boolean          default(FALSE)
#  user_rating_1          :boolean          default(FALSE)
#  user_rating_2          :boolean          default(FALSE)
#  user_rating_3          :boolean          default(FALSE)
#  allow_student_likes    :boolean          default(FALSE)
#  allow_comments         :boolean          default(FALSE)
#  research_1             :boolean          default(FALSE)
#  research_2             :boolean          default(FALSE)
#  pr_updates_1           :boolean          default(FALSE)
#  pr_updates_2           :boolean          default(FALSE)
#  pr_updates_3           :boolean          default(FALSE)
#  pr_updates_4           :boolean          default(FALSE)
#  metrics_1              :boolean          default(FALSE)
#  metrics_2              :boolean          default(FALSE)
#  metrics_3              :boolean          default(FALSE)
#  metrics_4              :boolean          default(FALSE)
#  metrics_5              :boolean          default(FALSE)
#  core_literacy_standard :string(255)
#  core_math_standard     :string(255)
#  form_update            :datetime         default(2000-01-01 00:00:00 UTC)
#

class PublisherProductDescription < ActiveRecord::Base
  
  attr_accessible :publisher_product_id,
                  :publisher_id,
                  :word_description,   
                  :name_product,        
                  :description,          
                  :source_url,           
                  :versions,           
                  :slugged,              
                  :product_tagline,      
                  :topic,               
                  :lesson_plan_subject,  
                  :updating_refresh_rate, 
                  :updating_type,       
                  :reselling,           
                  :evaluation,         
                  :allow_teacher_rating, 
                  :user_rating_1,        
                  :user_rating_2,        
                  :user_rating_3,         
                  :allow_student_likes,   
                  :allow_comments,     
                  :research_1,         
                  :research_2,        
                  :pr_updates_1,        
                  :pr_updates_2,        
                  :pr_updates_3,        
                  :pr_updates_4,         
                  :metrics_1,           
                  :metrics_2,        
                  :metrics_3,         
                  :metrics_4,         
                  :metrics_5,        
                  :core_literacy_standard,
                  :core_math_standard,
                  :form_update,
                  :created_at,
                  :updated_at 


                  
  
  belongs_to :publisher_product


  # config.active_record.default_timezone = :local
  
  
  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_product_descriptions")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_product_descriptions_id_seq RESTART WITH 1")
  end

  
end






  # price  :decimal(8, 2)


  # extend FriendlyId
  # friendly_id :id, use: :slugged

  # def id
    # [
      # :id
    # ]
  # end  

  # def to_param
    # "#{id}"
  # end
