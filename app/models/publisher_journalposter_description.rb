# == Schema Information
#
# Table name: publisher_journalposter_descriptions
#
#  id                         :integer          not null, primary key
#  publisher_journalposter_id :integer
#  publisher_id               :integer
#  created_at                 :datetime
#  updated_at                 :datetime
#  poster                     :integer
#  poster_text                :string(255)
#  logo                       :string(255)
#  tag_line                   :text
#  headline                   :string(255)
#  screen_shot                :string(255)
#  main_sales_phone           :string(255)
#  curriculum_resources       :integer
#  curriculum_resources_text  :string(255)
#  teacher_tools              :integer
#  teacher_tools_text         :string(255)
#  school_operations          :integer
#  school_operations_text     :string(255)
#  content                    :integer
#  content_text               :string(255)
#  prof_learning              :integer
#  prof_learning_text         :string(255)
#  cent21_learning            :integer
#  cent21_learning_text       :string(255)
#  language                   :integer
#  language_text              :string(255)
#  math                       :integer
#  math_text                  :string(255)
#  science                    :integer
#  science_text               :string(255)
#  social_studies             :integer
#  social_studies_text        :string(255)
#  special_ed                 :integer
#  special_ed_text            :string(255)
#  assmt_testing              :integer
#  assmt_testing_text         :string(255)
#  collaboration              :integer
#  collaboration_text         :string(255)
#  classroom_resp             :integer
#  classroom_resp_text        :string(255)
#  grading_atten              :integer
#  grading_atten_text         :string(255)
#  lesson_planning            :integer
#  lesson_planning_text       :string(255)
#  pres_tools                 :integer
#  pres_tools_text            :string(255)
#  lecture_capture            :integer
#  lecture_capture_text       :string(255)
#  plag_checks                :integer
#  plag_checks_text           :string(255)
#  learning_mgmt_systs        :integer
#  learning_mgmt_systs_text   :string(255)
#  student_info_systs         :integer
#  student_info_systs_text    :string(255)
#  web_filtering              :integer
#  web_filtering_text         :string(255)
#  device_mgmt                :integer
#  device_mgmt_text           :string(255)
#  virtual_dist_ed            :integer
#  virtual_dist_ed_text       :string(255)
#  testing_systs              :integer
#  testing_systs_text         :string(255)
#  unique_tech                :integer
#  unique_tech_text           :string(255)
#  apps                       :integer
#  apps_text                  :string(255)
#  digit_textbooks            :integer
#  digit_textbooks_text       :string(255)
#  games                      :integer
#  games_text                 :string(255)
#  study_tools                :integer
#  study_tools_text           :string(255)
#  video                      :integer
#  video_text                 :string(255)
#  dictionaries               :integer
#  dictionaries_text          :string(255)
#  directories                :integer
#  directories_text           :string(255)
#  subscrip_sites             :integer
#  subscrip_sites_text        :string(255)
#  ebook_game_creat           :integer
#  ebook_game_creat_text      :string(255)
#  digit_story_poster         :integer
#  digit_story_poster_text    :string(255)
#  courseware                 :integer
#  courseware_text            :string(255)
#  talent_mgmt                :integer
#  talent_mgmt_text           :string(255)
#  prof_devel_systems         :integer
#  prof_devel_systems_text    :string(255)
#  instr_design               :integer
#  instr_design_text          :string(255)
#  other_diy                  :integer
#  other_diy_text             :string(255)
#  word_descr                 :text
#  url                        :string(255)
#

class PublisherJournalposterDescription < ActiveRecord::Base

  attr_accessible :id,
                  :publisher_journalposter_id,
                  :publisher_id,              
                  :poster,                    
                  :poster_text,               
                  :logo,                      
                  :word_descr,               
                  :tag_line,               
                  :headline,                  
                  :screen_shot,              
                  :main_sales_phone,
                  :url,
                  :curriculum_resources,       
                  :curriculum_resources_text,  
                  :teacher_tools,             
                  :teacher_tools_text,        
                  :school_operations,        
                  :school_operations_text,     
                  :content,                   
                  :content_text,             
                  :prof_learning,             
                  :prof_learning_text,         
                  :cent21_learning,           
                  :cent21_learning_text,      
                  :language,                 
                  :language_text,              
                  :math,                     
                  :math_text,                 
                  :science,                  
                  :science_text,             
                  :social_studies,        
                  :social_studies_text,        
                  :special_ed,                
                  :special_ed_text,            
                  :assmt_testing,              
                  :assmt_testing_text,         
                  :collaboration,              
                  :collaboration_text,        
                  :classroom_resp,           
                  :classroom_resp_text,       
                  :grading_atten,         
                  :grading_atten_text,         
                  :lesson_planning,        
                  :lesson_planning_text,       
                  :pres_tools,               
                  :pres_tools_text,          
                  :lecture_capture,          
                  :lecture_capture_text,      
                  :plag_checks,              
                  :plag_checks_text,          
                  :learning_mgmt_systs,       
                  :learning_mgmt_systs_text,   
                  :student_info_systs,       
                  :student_info_systs_text,    
                  :web_filtering,             
                  :web_filtering_text,        
                  :device_mgmt,              
                  :device_mgmt_text,          
                  :virtual_dist_ed,          
                  :virtual_dist_ed_text,      
                  :testing_systs,             
                  :testing_systs_text,        
                  :unique_tech,              
                  :unique_tech_text,          
                  :apps,                      
                  :apps_text,                
                  :digit_textbooks,           
                  :digit_textbooks_text,      
                  :games,                     
                  :games_text,                
                  :study_tools,
                  :study_tools_text,          
                  :video,                    
                  :video_text,               
                  :dictionaries,          
                  :dictionaries_text,         
                  :directories,              
                  :directories_text,       
                  :subscrip_sites,           
                  :subscrip_sites_text,        
                  :ebook_game_creat,          
                  :ebook_game_creat_text,      
                  :digit_story_poster,       
                  :digit_story_poster_text,    
                  :courseware,                
                  :courseware_text,            
                  :talent_mgmt,              
                  :talent_mgmt_text,           
                  :prof_devel_systems,        
                  :prof_devel_systems_text,    
                  :instr_design,              
                  :instr_design_text,          
                  :other_diy,                 
                  :other_diy_text           




  belongs_to :publisher_journalposter
  

  def self.dbdelete
      self.connection.execute("DELETE FROM publisher_journalposter_descriptions")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE publisher_journalposter_descriptions_id_seq RESTART WITH 1")
  end

  
end
