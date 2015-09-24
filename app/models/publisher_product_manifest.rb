# == Schema Information
#
# Table name: publisher_product_manifests
#
#  id                     :integer          not null, primary key
#  created_at             :datetime
#  updated_at             :datetime
#  publisher_product_id   :integer          default(0)
#  publisher_id           :integer          default(0)
#  versions               :string(255)      default("")
#  updating_refresh_rate  :string(255)      default("")
#  updating_type          :string(255)      default("")
#  reselling              :boolean          default(FALSE)
#  evaluation             :string(255)      default("")
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
#  core_literacy_standard :string(255)      default("")
#  core_math_standard     :string(255)      default("")
#  form_update            :datetime         default(2000-01-01 00:00:00 UTC)
#  poster_print_purchase  :boolean          default(FALSE)
#  poster_pin_web         :boolean          default(FALSE)
#  poster_pin_purchase    :boolean          default(FALSE)
#  corporate_logo_url     :string(255)      default("")
#  lesson_time_hours      :integer          default(0)
#  lesson_time_minutes    :integer          default(0)
#  course_time_hours      :integer          default(0)
#  course_time_days       :integer          default(0)
#  course_time_months     :integer          default(0)
#  time_per_lesson        :boolean          default(FALSE)
#  time_per_course        :boolean          default(FALSE)
#  product_tagline        :string(255)      default("")
#  source_url             :string(255)      default("")
#  product_headline       :string(255)      default("")
#  product_name           :string(255)
#

class PublisherProductManifest < ActiveRecord::Base
  
  attr_accessible :publisher_product_id,
                  :publisher_id,
                  :product_name,        
                  :source_url,           
                  :versions,           
                  :product_tagline,      
                  :product_headline,
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
                  :poster_print_purchase,
                  :poster_pin_web,
                  :poster_pin_purchase,
                  :corporate_logo_url,
                  :lesson_time_hours,
                  :lesson_time_minutes,
                  :course_time_hours,
                  :course_time_days,
                  :course_time_months,
                  :time_per_lesson,
                  :time_per_course,
                  :created_at,
                  :updated_at 


  belongs_to :publisher_product


  # config.active_record.default_timezone = :local
  
  
  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_product_manifests")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_product_manifests_id_seq RESTART WITH 1")
  end

  
end
