class AlterJournalposterpurchase1 < ActiveRecord::Migration
  def change

      add_column :journalposterpurchases, :logo, :string, :limit => 255    
      add_column :journalposterpurchases, :word_descr, :text    
      add_column :journalposterpurchases, :tag_line, :text    
      add_column :journalposterpurchases, :headline, :string, :limit => 255    
      add_column :journalposterpurchases, :screen_shot, :string, :limit => 255    
      add_column :journalposterpurchases, :main_sales_phone, :string, :limit => 255    

    
      add_column :journalposterpurchases, :curriculum_resources, :integer    
      add_column :journalposterpurchases, :curriculum_resources_text, :string, :limit => 255    

      add_column :journalposterpurchases, :teacher_tools, :integer    
      add_column :journalposterpurchases, :teacher_tools_text, :string, :limit => 255    

      add_column :journalposterpurchases, :school_operations, :integer    
      add_column :journalposterpurchases, :school_operations_text, :string, :limit => 255    

      add_column :journalposterpurchases, :content, :integer    
      add_column :journalposterpurchases, :content_text, :string, :limit => 255    

      add_column :journalposterpurchases, :prof_learning, :integer    
      add_column :journalposterpurchases, :prof_learning_text, :string, :limit => 255    


      add_column :journalposterpurchases, :cent21_learning, :integer    
      add_column :journalposterpurchases, :cent21_learning_text, :string, :limit => 255    

      add_column :journalposterpurchases, :language, :integer    
      add_column :journalposterpurchases, :language_text, :string, :limit => 255    

      add_column :journalposterpurchases, :math, :integer    
      add_column :journalposterpurchases, :math_text, :string, :limit => 255    

      add_column :journalposterpurchases, :science, :integer    
      add_column :journalposterpurchases, :science_text, :string, :limit => 255    

      add_column :journalposterpurchases, :social_studies, :integer    
      add_column :journalposterpurchases, :social_studies_text, :string, :limit => 255    

      add_column :journalposterpurchases, :special_ed, :integer    
      add_column :journalposterpurchases, :special_ed_text, :string, :limit => 255    


      add_column :journalposterpurchases, :assmt_testing, :integer    
      add_column :journalposterpurchases, :assmt_testing_text, :string, :limit => 255    

      add_column :journalposterpurchases, :collaboration, :integer    
      add_column :journalposterpurchases, :collaboration_text, :string, :limit => 255    

      add_column :journalposterpurchases, :classroom_resp, :integer    
      add_column :journalposterpurchases, :classroom_resp_text, :string, :limit => 255    

      add_column :journalposterpurchases, :grading_atten, :integer    
      add_column :journalposterpurchases, :grading_atten_text, :string, :limit => 255    

      add_column :journalposterpurchases, :lesson_planning, :integer    
      add_column :journalposterpurchases, :lesson_planning_text, :string, :limit => 255    

      add_column :journalposterpurchases, :pres_tools, :integer    
      add_column :journalposterpurchases, :pres_tools_text, :string, :limit => 255    

      add_column :journalposterpurchases, :lecture_capture, :integer    
      add_column :journalposterpurchases, :lecture_capture_text, :string, :limit => 255    

      add_column :journalposterpurchases, :plag_checks, :integer    
      add_column :journalposterpurchases, :plag_checks_text, :string, :limit => 255    


      add_column :journalposterpurchases, :learning_mgmt_systs, :integer    
      add_column :journalposterpurchases, :learning_mgmt_systs_text, :string, :limit => 255    

      add_column :journalposterpurchases, :student_info_systs, :integer    
      add_column :journalposterpurchases, :student_info_systs_text, :string, :limit => 255    

      add_column :journalposterpurchases, :web_filtering, :integer    
      add_column :journalposterpurchases, :web_filtering_text, :string, :limit => 255    

      add_column :journalposterpurchases, :device_mgmt, :integer    
      add_column :journalposterpurchases, :device_mgmt_text, :string, :limit => 255    

      add_column :journalposterpurchases, :virtual_dist_ed, :integer    
      add_column :journalposterpurchases, :virtual_dist_ed_text, :string, :limit => 255    

      add_column :journalposterpurchases, :testing_systs, :integer    
      add_column :journalposterpurchases, :testing_systs_text, :string, :limit => 255    

      add_column :journalposterpurchases, :unique_tech, :integer    
      add_column :journalposterpurchases, :unique_tech_text, :string, :limit => 255    


      add_column :journalposterpurchases, :apps, :integer    
      add_column :journalposterpurchases, :apps_text, :string, :limit => 255    

      add_column :journalposterpurchases, :digit_textbooks, :integer    
      add_column :journalposterpurchases, :digit_textbooks_text, :string, :limit => 255    

      add_column :journalposterpurchases, :games, :integer    
      add_column :journalposterpurchases, :games_text, :string, :limit => 255    

      add_column :journalposterpurchases, :study_tools, :integer    
      add_column :journalposterpurchases, :study_tools_text, :string, :limit => 255    

      add_column :journalposterpurchases, :video, :integer    
      add_column :journalposterpurchases, :video_text, :string, :limit => 255    

      add_column :journalposterpurchases, :dictionaries, :integer    
      add_column :journalposterpurchases, :dictionaries_text, :string, :limit => 255    

      add_column :journalposterpurchases, :directories, :integer    
      add_column :journalposterpurchases, :directories_text, :string, :limit => 255    


      add_column :journalposterpurchases, :subscrip_sites, :integer    
      add_column :journalposterpurchases, :subscrip_sites_text, :string, :limit => 255    

      add_column :journalposterpurchases, :ebook_game_creat, :integer    
      add_column :journalposterpurchases, :ebook_game_creat_text, :string, :limit => 255    

      add_column :journalposterpurchases, :digit_story_poster, :integer    
      add_column :journalposterpurchases, :digit_story_poster_text, :string, :limit => 255    

      add_column :journalposterpurchases, :courseware, :integer    
      add_column :journalposterpurchases, :courseware_text, :string, :limit => 255    

      add_column :journalposterpurchases, :talent_mgmt, :integer    
      add_column :journalposterpurchases, :talent_mgmt_text, :string, :limit => 255    

      add_column :journalposterpurchases, :prof_devel_systems, :integer    
      add_column :journalposterpurchases, :prof_devel_systems_text, :string, :limit => 255    
      
      add_column :journalposterpurchases, :instr_design, :integer    
      add_column :journalposterpurchases, :instr_design_text, :string, :limit => 255    
      
      add_column :journalposterpurchases, :other_diy, :integer    
      add_column :journalposterpurchases, :other_diy_text, :string, :limit => 255    
    
  end
end
