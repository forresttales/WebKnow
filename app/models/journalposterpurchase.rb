# == Schema Information
#
# Table name: journalposterpurchases
#
#  id               :integer          not null, primary key
#  id_user          :integer
#  id_journalposter :integer
#  description      :string(255)
#  price            :decimal(5, 2)
#  created_at       :datetime
#  updated_at       :datetime
#

class Journalposterpurchase < ActiveRecord::Base
  
  attr_accessible :id,
                  :id_user,                   
                  :id_journalposter,          
                  :description,               
                  :price,                     
                  :logo,                      
                  :word_descr,              
                  :tag_line,                 
                  :headline,                  
                  :screen_shot,               
                  :main_sales_phone,      
                  :poster,               
                  :poster_text,            
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
                  :other_diy_text,           
                  :created_at,               
                  :updated_at              


  belongs_to :publisher
  # has_one :publisher_product_description


  # def total_price
    # # convert to array so it doesn't try to do sum on database directly
    # # line_items.to_a.sum(&:full_price)
  # end
#   
  # def paypal_url(return_url)
    # values = {
      # :business => 'seller_1229899173_biz@railscasts.com',
      # :cmd => '_cart',
      # :upload => 1,
      # :return => return_url,
      # :invoice => id
    # }
    # line_items.each_with_index do |item, index|
      # values.merge!({
        # "amount_#{index+1}" => item.unit_price,
        # "item_name_#{index+1}" => item.product.name,
        # "item_number_#{index+1}" => item.id,
        # "quantity_#{index+1}" => item.quantity
      # })
    # end
    # "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  # end  

    
end
