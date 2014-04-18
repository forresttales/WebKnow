class JournalposterpurchasesController < ApplicationController
  
  layout 'journalposterpurchase'
  
  
  @@user_id = nil

  
  def index
    
    @@user_id = params[:id]

    @journalposterpurchases = Journalposterpurchases.where("id_user = ?", @@user_id)
    
  end


  def new
    
    @jp = Journalposterpurchase.new
    
  end


  def show
    # @journalposterpurchase = current_journalposterpurchase
    # render text: params[:id]
    
    @jp = Journalposterpurchase.where("id_user = ?", session[:user_id])

    # @jp = Journalposterpurchase.find(params[:id])
    
  end

  def edit
    @publisher_product_description = PublisherProductDescription.find_by_id(params[:id])    
    
    publisher_product = PublisherProduct.find(@@publisher_product_id)
    @publisher_product_name = publisher_product.name_product
    # @publisher_product_has_description = publisher_product.has_description
    @publisher_product_id = @@publisher_product_id
    
    @type_content = ""
    
  end

  def create
    
    @jp = Journalposterpurchase.new(jp_params)
    
    jp = @jp

    jp.id_user = session[:user_id]
    
    case jp.poster  
      when 1
        jp.poster_text = "Free Online Poster Pin"
      when 2
        jp.poster_text = "Print Poster Pin and Online Listing"
      when 3
        jp.poster_text = "Poster Pin, Custom Ad Box, Online Listing"
      when 4
        jp.poster_text = "Poster Back Cover, Poster Pin, Online Listing"
      else
        jp.poster_text = ""
    end
    
    
    if jp.cent21_learning
      cent21_learning_text = "21st Century Learning"
    end 
    if jp.language
      language_text = "Language"
    end 
    if jp.math
      math_text = "Math"
    end 
    if jp.science
      science_text = "Science"
    end 
    if jp.social_studies
      social_studies_text = "Social Studies"
    end 
    if jp.special_ed
      special_ed_text = "Special Education"
    end 
    if jp.assmt_testing
      assmt_testing_text = "Assessment/Testing"
    end 
    if jp.collaboration
      collaboration_text = "Collaboration"
    end 
    if jp.classroom_resp
      classroom_resp_text = "Classroom Response"
    end 
    if jp.grading_atten
      grading_atten_text = "Grading/Attendance"
    end 
    if jp.lesson_planning
      lesson_planning_text = "Lesson Planning"
    end 
    if jp.pres_tools
      pres_tools_text = "Presentation Tools"
    end 
    if jp.lecture_capture
      lecture_capture_text = "Lecture Capture"
    end 
    if jp.plag_checks
      plag_checks_text = "Plagiarism Checks"
    end 
    if jp.learning_mgmt_systs
      learning_mgmt_systs_text = "Learning Management Systems"
    end 
    if jp.student_info_systs
      student_info_systs_text = "Student Information Systems"
    end 
    if jp.web_filtering
      web_filtering_text = "Web Filtering"
    end 
    if jp.device_mgmt
      device_mgmt_text = "Device Management"
    end 
    if jp.virtual_dist_ed
      virtual_dist_ed_text = "Virtual Schools and Distance Education"
    end 
    if jp.testing_systs
      testing_systs_text = "Testing Systems"
    end 
    if jp.unique_tech
      unique_tech_text = "Unique Tech"
    end 
    if jp.apps
      apps_text = "Apps"
    end 
    if jp.digit_textbooks
      digit_textbooks_text = "Digital Textbooks/eBooks"
    end 
    if jp.games
      games_text = "Games"
    end 
    if jp.study_tools
      study_tools_text = "Study Tools"
    end 
    if jp.video
      video_text = "Video"
    end 
    if jp.dictionaries
      dictionaries_text = "Dictionaries"
    end 
    if jp.directories
      directories_text = "Directories"
    end 
    if jp.subscrip_sites
      subscrip_sites_text = "Subscription Sites"
    end 
    if jp.ebook_game_creat
      ebook_game_creat_text = "eBook Creation/Game Creation"
    end 
    if jp.digit_story_poster
      digit_story_poster_text = "Digital Storytelling/PosterBoarding"
    end 
    if jp.courseware
      courseware_text = "Courseware"
    end 
    if jp.talent_mgmt
      talent_mgmt_text = "Talent Management"
    end 
    if jp.prof_devel_systems
      prof_devel_systems_text = "Professional Development Systems"
    end 
    if jp.instr_design
      instr_design_text = "Instructional Design"
    end 
    if jp.other_diy
      other_diy_text = "Other DIY"
    end 

    if jp.save
      
      session[:jp_saved] = true
      
      #mail = RegEventMailer.welcome_email(@reg_event)
      #mail.deliver
      
      # redirect_to '/Journal-Poster-Selections?id=' + @@publisher_product_id.to_s      
      # redirect_to '/Journal-Poster-Selections/' + jp.id.to_s      
      # redirect_to '/Journal-Poster-Selections'      
 
    else
      session[:jp_saved] = nil
    end

    
  end

  def update  
    render text: 'update journalposterpurchases'  
  end
  
  
  
  private

    def jp_params
      params.require(:journalposterpurchase).permit(
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
                                )
    end


end
