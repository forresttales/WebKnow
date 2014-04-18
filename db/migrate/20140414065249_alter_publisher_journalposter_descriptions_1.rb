class AlterPublisherJournalposterDescriptions1 < ActiveRecord::Migration
  def change
    
      add_column :publisher_journalposter_descriptions, :poster, :integer    
      add_column :publisher_journalposter_descriptions, :poster_text, :string, :limit => 255    

      add_column :publisher_journalposter_descriptions, :logo, :string, :limit => 255    
      add_column :publisher_journalposter_descriptions, :word_descr, :text    
      add_column :publisher_journalposter_descriptions, :tag_line, :text    
      add_column :publisher_journalposter_descriptions, :headline, :string, :limit => 255    
      add_column :publisher_journalposter_descriptions, :screen_shot, :string, :limit => 255    
      add_column :publisher_journalposter_descriptions, :main_sales_phone, :string, :limit => 255    

    
      add_column :publisher_journalposter_descriptions, :curriculum_resources, :integer    
      add_column :publisher_journalposter_descriptions, :curriculum_resources_text, :string, :limit => 255    

      add_column :publisher_journalposter_descriptions, :teacher_tools, :integer    
      add_column :publisher_journalposter_descriptions, :teacher_tools_text, :string, :limit => 255    

      add_column :publisher_journalposter_descriptions, :school_operations, :integer    
      add_column :publisher_journalposter_descriptions, :school_operations_text, :string, :limit => 255    

      add_column :publisher_journalposter_descriptions, :content, :integer    
      add_column :publisher_journalposter_descriptions, :content_text, :string, :limit => 255    

      add_column :publisher_journalposter_descriptions, :prof_learning, :integer    
      add_column :publisher_journalposter_descriptions, :prof_learning_text, :string, :limit => 255    


      add_column :publisher_journalposter_descriptions, :cent21_learning, :integer    
      add_column :publisher_journalposter_descriptions, :cent21_learning_text, :string, :limit => 255    

      add_column :publisher_journalposter_descriptions, :language, :integer    
      add_column :publisher_journalposter_descriptions, :language_text, :string, :limit => 255    

      add_column :publisher_journalposter_descriptions, :math, :integer    
      add_column :publisher_journalposter_descriptions, :math_text, :string, :limit => 255    

      add_column :publisher_journalposter_descriptions, :science, :integer    
      add_column :publisher_journalposter_descriptions, :science_text, :string, :limit => 255    

      add_column :publisher_journalposter_descriptions, :social_studies, :integer    
      add_column :publisher_journalposter_descriptions, :social_studies_text, :string, :limit => 255    

      add_column :publisher_journalposter_descriptions, :special_ed, :integer    
      add_column :publisher_journalposter_descriptions, :special_ed_text, :string, :limit => 255    


      add_column :publisher_journalposter_descriptions, :assmt_testing, :integer    
      add_column :publisher_journalposter_descriptions, :assmt_testing_text, :string, :limit => 255    

      add_column :publisher_journalposter_descriptions, :collaboration, :integer    
      add_column :publisher_journalposter_descriptions, :collaboration_text, :string, :limit => 255    

      add_column :publisher_journalposter_descriptions, :classroom_resp, :integer    
      add_column :publisher_journalposter_descriptions, :classroom_resp_text, :string, :limit => 255    

      add_column :publisher_journalposter_descriptions, :grading_atten, :integer    
      add_column :publisher_journalposter_descriptions, :grading_atten_text, :string, :limit => 255    

      add_column :publisher_journalposter_descriptions, :lesson_planning, :integer    
      add_column :publisher_journalposter_descriptions, :lesson_planning_text, :string, :limit => 255    

      add_column :publisher_journalposter_descriptions, :pres_tools, :integer    
      add_column :publisher_journalposter_descriptions, :pres_tools_text, :string, :limit => 255    

      add_column :publisher_journalposter_descriptions, :lecture_capture, :integer    
      add_column :publisher_journalposter_descriptions, :lecture_capture_text, :string, :limit => 255    

      add_column :publisher_journalposter_descriptions, :plag_checks, :integer    
      add_column :publisher_journalposter_descriptions, :plag_checks_text, :string, :limit => 255    


      add_column :publisher_journalposter_descriptions, :learning_mgmt_systs, :integer    
      add_column :publisher_journalposter_descriptions, :learning_mgmt_systs_text, :string, :limit => 255    

      add_column :publisher_journalposter_descriptions, :student_info_systs, :integer    
      add_column :publisher_journalposter_descriptions, :student_info_systs_text, :string, :limit => 255    

      add_column :publisher_journalposter_descriptions, :web_filtering, :integer    
      add_column :publisher_journalposter_descriptions, :web_filtering_text, :string, :limit => 255    

      add_column :publisher_journalposter_descriptions, :device_mgmt, :integer    
      add_column :publisher_journalposter_descriptions, :device_mgmt_text, :string, :limit => 255    

      add_column :publisher_journalposter_descriptions, :virtual_dist_ed, :integer    
      add_column :publisher_journalposter_descriptions, :virtual_dist_ed_text, :string, :limit => 255    

      add_column :publisher_journalposter_descriptions, :testing_systs, :integer    
      add_column :publisher_journalposter_descriptions, :testing_systs_text, :string, :limit => 255    

      add_column :publisher_journalposter_descriptions, :unique_tech, :integer    
      add_column :publisher_journalposter_descriptions, :unique_tech_text, :string, :limit => 255    


      add_column :publisher_journalposter_descriptions, :apps, :integer    
      add_column :publisher_journalposter_descriptions, :apps_text, :string, :limit => 255    

      add_column :publisher_journalposter_descriptions, :digit_textbooks, :integer    
      add_column :publisher_journalposter_descriptions, :digit_textbooks_text, :string, :limit => 255    

      add_column :publisher_journalposter_descriptions, :games, :integer    
      add_column :publisher_journalposter_descriptions, :games_text, :string, :limit => 255    

      add_column :publisher_journalposter_descriptions, :study_tools, :integer    
      add_column :publisher_journalposter_descriptions, :study_tools_text, :string, :limit => 255    

      add_column :publisher_journalposter_descriptions, :video, :integer    
      add_column :publisher_journalposter_descriptions, :video_text, :string, :limit => 255    

      add_column :publisher_journalposter_descriptions, :dictionaries, :integer    
      add_column :publisher_journalposter_descriptions, :dictionaries_text, :string, :limit => 255    

      add_column :publisher_journalposter_descriptions, :directories, :integer    
      add_column :publisher_journalposter_descriptions, :directories_text, :string, :limit => 255    


      add_column :publisher_journalposter_descriptions, :subscrip_sites, :integer    
      add_column :publisher_journalposter_descriptions, :subscrip_sites_text, :string, :limit => 255    

      add_column :publisher_journalposter_descriptions, :ebook_game_creat, :integer    
      add_column :publisher_journalposter_descriptions, :ebook_game_creat_text, :string, :limit => 255    

      add_column :publisher_journalposter_descriptions, :digit_story_poster, :integer    
      add_column :publisher_journalposter_descriptions, :digit_story_poster_text, :string, :limit => 255    

      add_column :publisher_journalposter_descriptions, :courseware, :integer    
      add_column :publisher_journalposter_descriptions, :courseware_text, :string, :limit => 255    

      add_column :publisher_journalposter_descriptions, :talent_mgmt, :integer    
      add_column :publisher_journalposter_descriptions, :talent_mgmt_text, :string, :limit => 255    

      add_column :publisher_journalposter_descriptions, :prof_devel_systems, :integer    
      add_column :publisher_journalposter_descriptions, :prof_devel_systems_text, :string, :limit => 255    
      
      add_column :publisher_journalposter_descriptions, :instr_design, :integer    
      add_column :publisher_journalposter_descriptions, :instr_design_text, :string, :limit => 255    
      
      add_column :publisher_journalposter_descriptions, :other_diy, :integer    
      add_column :publisher_journalposter_descriptions, :other_diy_text, :string, :limit => 255    
    
  end
end
