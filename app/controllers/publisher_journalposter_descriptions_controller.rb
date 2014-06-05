class PublisherJournalposterDescriptionsController < ApplicationController

  layout 'publisher'
  
  before_filter :force_http

  helper_method :log_available_posters
  
  
  @@publisher_journalposter_id = nil
  
  def index

    @@publisher_journalposter_id = params[:id]
    session[:publisher_journalposter_id] = params[:id]

    @publisher_journalposter_descriptions = PublisherJournalposterDescription.where("publisher_journalposter_id = ?", @@publisher_journalposter_id)
    
    if @publisher_journalposter_descriptions.any?
      session[:publisher_has_journalposter] = true
    end
    
    @publisher_journalposter = PublisherJournalposter.find(@@publisher_journalposter_id)
    # @publisher_journalposter_name = @publisher_journalposter.name_journalposter
    # @publisher_journalposter_has_description = @publisher_journalposter.has_description
    @publisher_journalposter_id = @@publisher_journalposter_id
    
    @publisher_journalposter_has_journalposter_logo = @publisher_journalposter.has_journalposter_logo
    @publisher_journalposter_has_journalposter_prodshot = @publisher_journalposter.has_journalposter_prodshot

    # if @publisher_journalposter_has_journalposter_logo
      # gon.image_name = @publisher_journalposter.journalposter_logo
    # else
      # gon.image_name = ''
    # end

    @has_journalposter_metadata = @publisher_journalposter.has_journalposter_metadata
    
    gon.publisher_journalposter_description = @publisher_journalposter_descriptions[0]       

    @journalposter_metadata = ''
    if @has_journalposter_metadata
      @journalposter_metadata = @publisher_journalposter.journalposter_metadata
    end

    @publisher_journalposter_logos = PublisherJournalposterLogo.where("publisher_journalposter_id = ?", @@publisher_journalposter_id)

    # if @publisher_journalposter_logos.any?
      # @publisher_journalposter_logo_id = @publisher_journalposter_logos[0].id
    # end
    
  end
  
  
  def show
    
    # @publisher_journalposter_desciptions = PublisherJournalposterDescription.find(params[:id])
    @publisher_journalposter_descriptions = PublisherJournalposterDescription.where("id = ?", params[:id])
    
  end
  
  
  def new
    
    if !(session[:username].nil? or session[:publisher_id].nil?)
      # @username = session[:username]
      @publisher_journalposter_description = PublisherJournalposterDescription.new
    else
      render text: 'failed sessions'
    end
    
  end

  
  def create

    id_map = 1

    publisher_journalposter_description = PublisherJournalposterDescription.new(publisher_journalposter_description_params)
    # publisher_journalposter = PublisherJournalposter.find( @@publisher_journalposter_id )
    # publisher_journalposter_description.publisher_journalposter_id = @@publisher_journalposter_id    
    # publisher_journalposter_description.publisher_id = session[:publisher_id]

    # {"word_descr"=>"k", "tag_line"=>"k", "headline"=>"k", "main_sales_phone"=>"k", "url"=>"k", "curriculum_resources"=>"1", "teacher_tools"=>"0", "school_operations"=>"0", "content"=>"0", "prof_learning"=>"0", "cent21_learning"=>"0", "language"=>"0", "math"=>"0", "science"=>"0", "social_studies"=>"0", "special_ed"=>"0", "assmt_testing"=>"0", "collaboration"=>"0", "classroom_resp"=>"0", "grading_atten"=>"0", "lesson_planning"=>"0", "pres_tools"=>"0", "lecture_capture"=>"0", "plag_checks"=>"0", "learning_mgmt_systs"=>"0", "student_info_systs"=>"0", "web_filtering"=>"0", "device_mgmt"=>"0", "virtual_dist_ed"=>"0", "testing_systs"=>"0", "unique_tech"=>"0", "apps"=>"0", "digit_textbooks"=>"0", "games"=>"0", "study_tools"=>"0", "video"=>"0", "dictionaries"=>"0", "directories"=>"0", "subscrip_sites"=>"0", "ebook_game_creat"=>"0", "digit_story_poster"=>"0", "courseware"=>"0", "talent_mgmt"=>"0", "prof_devel_systems"=>"0", "instr_design"=>"0", "other_diy"=>"0"}



    
    # publisher_journalposter.poster = session[:poster]
    # publisher_journalposter.publisher_id = session[:publisher_id]

    publisher_journalposter_description.poster = session[:poster]
    
    h_new = Hash.new
    h_new[:poster] = session[:poster]
    h_new[:publisher_id] = session[:publisher_id]
    
    h_new[:id_map] = id_map
    
    
    case session[:poster].to_s  
      when "1"
        h_new[:poster_text] = "Free Online Poster Pin"        
        publisher_journalposter_description.poster_text = "Free Online Poster Pin"
      when "2"
        h_new[:poster_text] = "Print Poster Pin and Online Listing"
        publisher_journalposter_description.poster_text = "Print Poster Pin and Online Listing"
      when "3"
        h_new[:poster_text] = "Poster Pin, Custom Ad Box, Online Listing"
        publisher_journalposter_description.poster_text = "Poster Pin, Custom Ad Box, Online Listing"
      when "4"
        h_new[:poster_text] = "Poster Back Cover, Poster Pin, Online Listing"
        publisher_journalposter_description.poster_text = "Poster Back Cover, Poster Pin, Online Listing"
      else
        h_new[:poster_text] = "save failed"
        publisher_journalposter_description.poster_text = ""
    end

    publisher_journalposter = PublisherJournalposter.new(h_new)


    
    if publisher_journalposter_description.cent21_learning == 1
      publisher_journalposter_description.cent21_learning_text = "21st Century Learning"
    end 
    if publisher_journalposter_description.language == 1
      publisher_journalposter_description.language_text = "Language"
    end 
    if publisher_journalposter_description.math == 1
      publisher_journalposter_description.math_text = "Math"
    end 
    if publisher_journalposter_description.science == 1
      publisher_journalposter_description.science_text = "Science"
    end 
    if publisher_journalposter_description.social_studies == 1
      publisher_journalposter_description.social_studies_text = "Social Studies"
    end 
    if publisher_journalposter_description.special_ed == 1
      publisher_journalposter_description.special_ed_text = "Special Education"
    end 
    if publisher_journalposter_description.assmt_testing == 1
      publisher_journalposter_description.assmt_testing_text = "Assessment/Testing"
    end 
    if publisher_journalposter_description.collaboration == 1
      publisher_journalposter_description.collaboration_text = "Collaboration"
    end 
    if publisher_journalposter_description.classroom_resp == 1
      publisher_journalposter_description.classroom_resp_text = "Classroom Response"
    end 
    if publisher_journalposter_description.grading_atten == 1
      publisher_journalposter_description.grading_atten_text = "Grading/Attendance"
    end 
    if publisher_journalposter_description.lesson_planning == 1
      publisher_journalposter_description.lesson_planning_text = "Lesson Planning"
    end 
    if publisher_journalposter_description.pres_tools == 1
      publisher_journalposter_description.pres_tools_text = "Presentation Tools"
    end 
    if publisher_journalposter_description.lecture_capture == 1
      publisher_journalposter_description.lecture_capture_text = "Lecture Capture"
    end 
    if publisher_journalposter_description.plag_checks == 1
      publisher_journalposter_description.plag_checks_text = "Plagiarism Checks"
    end 
    if publisher_journalposter_description.learning_mgmt_systs == 1
      publisher_journalposter_description.learning_mgmt_systs_text = "Learning Management Systems"
    end 
    if publisher_journalposter_description.student_info_systs == 1
      publisher_journalposter_description.student_info_systs_text = "Student Information Systems"
    end 
    if publisher_journalposter_description.web_filtering == 1
      publisher_journalposter_description.web_filtering_text = "Web Filtering"
    end 
    if publisher_journalposter_description.device_mgmt == 1
      publisher_journalposter_description.device_mgmt_text = "Device Management"
    end 
    if publisher_journalposter_description.virtual_dist_ed == 1
      publisher_journalposter_description.virtual_dist_ed_text = "Virtual Schools and Distance Education"
    end 
    if publisher_journalposter_description.testing_systs == 1
      publisher_journalposter_description.testing_systs_text = "Testing Systems"
    end 
    if publisher_journalposter_description.unique_tech == 1
      publisher_journalposter_description.unique_tech_text = "Unique Tech"
    end 
    if publisher_journalposter_description.apps == 1
      publisher_journalposter_description.apps_text = "Apps"
    end 
    if publisher_journalposter_description.digit_textbooks == 1
      publisher_journalposter_description.digit_textbooks_text = "Digital Textbooks/eBooks"
    end 
    if publisher_journalposter_description.games == 1
      publisher_journalposter_description.games_text = "Games"
    end 
    if publisher_journalposter_description.study_tools == 1
      publisher_journalposter_description.study_tools_text = "Study Tools"
    end 
    if publisher_journalposter_description.video == 1
      publisher_journalposter_description.video_text = "Video"
    end 
    if publisher_journalposter_description.dictionaries == 1
      publisher_journalposter_description.dictionaries_text = "Dictionaries"
    end 
    if publisher_journalposter_description.directories == 1
      publisher_journalposter_description.directories_text = "Directories"
    end 
    if publisher_journalposter_description.subscrip_sites == 1
      publisher_journalposter_description.subscrip_sites_text = "Subscription Sites"
    end 
    if publisher_journalposter_description.ebook_game_creat == 1
      publisher_journalposter_description.ebook_game_creat_text = "eBook Creation/Game Creation"
    end 
    if publisher_journalposter_description.digit_story_poster == 1
      publisher_journalposter_description.digit_story_poster_text = "Digital Storytelling/PosterBoarding"
    end 
    if publisher_journalposter_description.courseware == 1
      publisher_journalposter_description.courseware_text = "Courseware"
    end 
    if publisher_journalposter_description.talent_mgmt == 1
      publisher_journalposter_description.talent_mgmt_text = "Talent Management"
    end 
    if publisher_journalposter_description.prof_devel_systems == 1
      publisher_journalposter_description.prof_devel_systems_text = "Professional Development Systems"
    end 
    if publisher_journalposter_description.instr_design == 1
      publisher_journalposter_description.instr_design_text = "Instructional Design"
    end 
    if publisher_journalposter_description.other_diy == 1
      publisher_journalposter_description.other_diy_text = "Other DIY"
    end 

    
    publisher_journalposter_description.publisher_id = session[:publisher_id]
    
    if publisher_journalposter.save      
      @@publisher_journalposter_id = publisher_journalposter.id
      publisher_journalposter_description.publisher_journalposter_id = @@publisher_journalposter_id 
      if publisher_journalposter_description.save
        log_available_posters(id_map)
        redirect_to '/PublisherJournalPosterDescription?id=' + @@publisher_journalposter_id.to_s
      else
        render text: 'Save Publisher Journalposter Description failed'
      end
    else
      render text: 'Update publisher_journalposter_id failed'
    end
    
    
    

    # if publisher_journalposter.update_columns( :has_description => true)      
      # if publisher_journalposter_description.save
        # redirect_to '/PublisherJournalPosterDescription?id=' + @@publisher_journalposter_id.to_s
      # else
        # render text: 'Save Publisher Journalposter Description failed'
      # end
    # else
      # render text: 'Update publisher_journalposter_id failed'
    # end
    
  end


  def edit
    @publisher_journalposter_description = PublisherJournalposterDescription.find_by_id(params[:id])    
    
    #if @publisher_journalposter_description.any?
      #gon.curriculum_resources = @publisher_journalposter_description.curriculum_resources       
    #end
    
    gon.publisher_journalposter_description = @publisher_journalposter_description       
    
    #render text: 'publisher_journalposter_description' + params[:id]
    
    #@publisher_journalposter_description = PublisherJournalposterDescription.where("publisher_journalposter_id = ?", params[:id])    
    
    #publisher_journalposter = PublisherJournalposter.find(@@publisher_journalposter_id)
    #@publisher_journalposter_name = publisher_journalposter.name_journalposter
    # @publisher_journalposter_has_description = publisher_journalposter.has_description
    #@publisher_journalposter_id = @@publisher_journalposter_id
    
    #@type_content = ""
    
  end
  
  
  def update
    
    #render text: publisher_journalposter_description_params
    
    publisher_journalposter_description = PublisherJournalposterDescription.find(params[:id])
    
    publisher_journalposter = PublisherJournalposter.find_by_id(publisher_journalposter_description.publisher_journalposter_id)
    publisher_journalposter_description_temp = PublisherJournalposterDescription.new(publisher_journalposter_description_params)
    #poster = publisher_journalposter_description_temp.poster

    h_update = Hash.new
    h_update = publisher_journalposter_description_params
    #h_update[:publisher_journalposter_description][:poster_text] = poster_text
    # h_update[:poster_text] = ""

    h_update_1 = Hash.new
    #h_update_1 = params[:publisher_journalposter_description]
    #h_update_1[:publisher_journalposter][:poster_text] = poster_text
    h_update_1[:poster] = ""
    h_update_1[:poster_text] = ""

    #{"curriculum_resources"=>"1", "cent21_learning"=>"0", "language"=>"1"}

    #publisher_journalposter.poster = session[:poster]
    
    h_update_1[:poster] = session[:poster]    
    case session[:poster]  
      when "1"
        h_update_1[:poster_text] = "Free Online Poster Pin"
      when "2"
        h_update_1[:poster_text] = "Print Poster Pin and Online Listing"
      when "3"
        h_update_1[:poster_text] = "Poster Pin, Custom Ad Box, Online Listing"
      when "4"
        h_update_1[:poster_text] = "Poster Back Cover, Poster Pin, Online Listing"
      else
        #
    end

    # publisher_journalposter.poster = session[:poster]    
    # case session[:poster]  
      # when 1
        # publisher_journalposter.poster_text = "Free Online Poster Pin"
      # when 2
        # publisher_journalposter.poster_text = "Print Poster Pin and Online Listing"
      # when 3
        # publisher_journalposter.poster_text = "Poster Pin, Custom Ad Box, Online Listing"
      # when 4
        # publisher_journalposter.poster_text = "Poster Back Cover, Poster Pin, Online Listing"
      # else
        # #
    # end

    #publisher_journalposter_description.poster = session[:poster]
    
    h_update[:poster] = session[:poster]    
    case session[:poster]  
      when "1"
        h_update[:poster_text] = "Free Online Poster Pin"
      when "2"
        h_update[:poster_text] = "Print Poster Pin and Online Listing"
      when "3"
        h_update[:poster_text] = "Poster Pin, Custom Ad Box, Online Listing"
      when "4"
        h_update[:poster_text] = "Poster Back Cover, Poster Pin, Online Listing"
      else
        #
    end

    if publisher_journalposter_description_temp.curriculum_resources == 1
      h_update[:curriculum_resources_text] = "Curriculum Resources"
    else
      h_update[:curriculum_resources_text] = ""
    end 
    if publisher_journalposter_description_temp.cent21_learning == 1
      h_update[:cent21_learning_text] = "21st Century Learning"
    else
      h_update[:cent21_learning_text] = ""
    end 
    if publisher_journalposter_description_temp.language == 1
      h_update[:language_text] = "Language"
    else
      h_update[:language_text] = ""
    end 
    if publisher_journalposter_description_temp.math == 1
      h_update[:math_text] = "Math"
    else
      h_update[:math_text] = ""
    end 
    if publisher_journalposter_description_temp.science == 1
      h_update[:science_text] = "Science"
    else
      h_update[:science_text] = ""
    end 
    if publisher_journalposter_description_temp.social_studies == 1
      h_update[:social_studies_text] = "Social Studies"
    else
      h_update[:social_studies_text] = ""
    end 
    if publisher_journalposter_description_temp.special_ed == 1
      h_update[:special_ed_text] = "Special Education"
    else
      h_update[:special_ed_text] = ""
    end 
    if publisher_journalposter_description_temp.assmt_testing == 1
      h_update[:assmt_testing_text] = "Assessment/Testing"
    else
      h_update[:assmt_testing_text] = ""
    end 
    if publisher_journalposter_description_temp.collaboration == 1
      h_update[:collaboration_text] = "Collaboration"
    else
      h_update[:collaboration_text] = ""
    end 
    if publisher_journalposter_description_temp.classroom_resp == 1
      h_update[:classroom_resp_text] = "Classroom Response"
    else
      h_update[:classroom_resp_text] = ""
    end 
    if publisher_journalposter_description_temp.grading_atten == 1
      h_update[:grading_atten_text] = "Grading/Attendance"
    else
      h_update[:grading_atten_text] = ""
    end 
    if publisher_journalposter_description_temp.lesson_planning == 1
      h_update[:lesson_planning_text] = "Lesson Planning"
    else
      h_update[:lesson_planning_text] = ""
    end 
    if publisher_journalposter_description_temp.pres_tools == 1
      h_update[:pres_tools_text] = "Presentation Tools"
    else
      h_update[:pres_tools_text] = ""
    end 
    if publisher_journalposter_description_temp.lecture_capture == 1
      h_update[:lecture_capture_text] = "Lecture Capture"
    else
      h_update[:lecture_capture_text] = ""
    end 
    if publisher_journalposter_description_temp.plag_checks == 1
      h_update[:plag_checks_text] = "Plagiarism Checks"
    else
      h_update[:plag_checks_text] = ""
    end 
    if publisher_journalposter_description_temp.learning_mgmt_systs == 1
      h_update[:learning_mgmt_systs_text] = "Learning Management Systems"
    else
      h_update[:learning_mgmt_systs_text] = ""
    end 
    if publisher_journalposter_description_temp.student_info_systs == 1
      h_update[:student_info_systs_text] = "Student Information Systems"
    else
      h_update[:student_info_systs_text] = ""
    end 
    if publisher_journalposter_description_temp.web_filtering == 1
      h_update[:web_filtering_text] = "Web Filtering"
    else
      h_update[:web_filtering_text] = ""
    end 
    if publisher_journalposter_description_temp.device_mgmt == 1
      h_update[:device_mgmt_text] = "Device Management"
    else
      h_update[:device_mgmt_text] = ""
    end 
    if publisher_journalposter_description_temp.virtual_dist_ed == 1
      h_update[:virtual_dist_ed_text] = "Virtual Schools and Distance Education"
    else
      h_update[:virtual_dist_ed_text] = ""
    end 
    if publisher_journalposter_description_temp.testing_systs == 1
      h_update[:testing_systs_text] = "Testing Systems"
    else
      h_update[:testing_systs_text] = ""
    end 
    if publisher_journalposter_description_temp.unique_tech == 1
      h_update[:unique_tech_text] = "Unique Tech"
    else
      h_update[:unique_tech_text] = ""
    end 
    if publisher_journalposter_description_temp.apps == 1
      h_update[:apps_text] = "Apps"
    else
      h_update[:apps_text] = ""
    end 
    if publisher_journalposter_description_temp.digit_textbooks == 1
      h_update[:digit_textbooks_text] = "Digital Textbooks/eBooks"
    else
      h_update[:digit_textbooks_text] = ""
    end 
    if publisher_journalposter_description_temp.games == 1
      h_update[:games_text] = "Games"
    else
      h_update[:games_text] = ""
    end 
    if publisher_journalposter_description_temp.study_tools == 1
      h_update[:study_tools_text] = "Study Tools"
    else
      h_update[:study_tools_text] = ""
    end 
    if publisher_journalposter_description_temp.video == 1
      h_update[:video_text] = "Video"
    else
      h_update[:video_text] = ""
    end 
    if publisher_journalposter_description_temp.dictionaries == 1
      h_update[:dictionaries_text] = "Dictionaries"
    else
      h_update[:dictionaries_text] = ""
    end 
    if publisher_journalposter_description_temp.directories == 1
      h_update[:directories_text] = "Directories"
    else
      h_update[:directories_text] = ""
    end 
    if publisher_journalposter_description_temp.subscrip_sites == 1
      h_update[:subscrip_sites_text] = "Subscription Sites"
    else
      h_update[:subscrip_sites_text] = ""
    end 
    if publisher_journalposter_description_temp.ebook_game_creat == 1
      h_update[:ebook_game_creat_text] = "eBook Creation/Game Creation"
    else
      h_update[:ebook_game_creat_text] = ""
    end 
    if publisher_journalposter_description_temp.digit_story_poster == 1
      h_update[:digit_story_poster_text] = "Digital Storytelling/PosterBoarding"
    else
      h_update[:digit_story_poster_text] = ""
    end 
    if publisher_journalposter_description_temp.courseware == 1
      h_update[:courseware_text] = "Courseware"
    else
      h_update[:courseware_text] = ""
    end 
    if publisher_journalposter_description_temp.talent_mgmt == 1
      h_update[:talent_mgmt_text] = "Talent Management"
    else
      h_update[:talent_mgmt_text] = ""
    end 
    if publisher_journalposter_description_temp.prof_devel_systems == 1
      h_update[:prof_devel_systems_text] = "Professional Development Systems"
    else
      h_update[:prof_devel_systems_text] = ""
    end 
    if publisher_journalposter_description_temp.instr_design == 1
      h_update[:instr_design_text] = "Instructional Design"
    else
      h_update[:instr_design_text] = ""
    end 
    if publisher_journalposter_description_temp.other_diy == 1
      h_update[:other_diy_text] = "Other DIY"
    else
      h_update[:other_diy_text] = ""
    end 

    #render text: h_update

    publisher_journalposter_description_temp = nil

    if publisher_journalposter.update_attributes(h_update_1)
        if publisher_journalposter_description.update_attributes(h_update)
        # if publisher_journalposter_description.update_attributes(publisher_journalposter_description_params)
            # redirect_to '/PublisherJournalPosterDescription?id=' + @@publisher_journalposter_id.to_s
            redirect_to '/PublisherJournalPosterDescription?id=' + params[:id].to_s
        else
          render text: 'publisher_journalposter_description update failed'
        end    
    else
        render text: 'publisher_journalposter update failed'      
    end
    
  end
  
  
  def upload
    
    render text: 'upload'
    
    # uploaded_io = params[:upload_file]
    # render text: params[:upload_file]

    # File.open(Rails.root.join('public', 'images_publisher_journalposter_logo', uploaded_io.original_filename), 'wb') do |file|
      # file.write(uploaded_io.read)
    # end

    # publisher_journalposter = PublisherJournalposter.find( @@publisher_journalposter_id )
    # publisher_journalposter.journalposter_logo = uploaded_io.original_filename
    # publisher_journalposter.has_journalposter_logo = true
    
    # h_update = Hash.new
    # h_update = { :journalposter_logo => '', :has_journalposter_logo => false }
    # h_update['journalposter_logo'] = uploaded_io.original_filename
    # h_update['has_journalposter_logo'] = true
    
    # if publisher_journalposter.update_columns( h_update )
      # redirect_to '/PublisherJournalposterDescription?id=' + @@publisher_journalposter_id.to_s
    # else
      # render text: 'Journalposter Logo save failed'
    # end      
  end
  

  def dbdelete

      # render text: 'dbdelete'
      
      PublisherJournalposterDescription.dbdelete
      PublisherJournalposterDescription.dbclear
      
      respond_to do |format|
        format.js { redirect_to(:action => 'index', :form => :js ) }
        format.html
      end
      
  end
  
  
  private

    def publisher_journalposter_description_params
      params.require(:publisher_journalposter_description).permit(      
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
                  )

    end

      
      
    def log_available_posters(id_map)
      
      section_1 = 0
      section_2 = 0
      section_3 = 0
      section_4 = 0
      section_5 = 0
      section_6 = 0
  
      jp_count_section_1 = 0
      jp_count_section_2 = 0
      jp_count_section_3 = 0
      jp_count_section_4 = 0
      jp_count_section_5 = 0
      jp_count_section_6 = 0
  
      publisher_journalposters = PublisherJournalposter.where("id_map = ?", id_map)    
      if publisher_journalposters.any?
        
        publisher_journalposters.each do|publisher_journalposter|
          
          publisher_journalposter_descriptions = PublisherJournalposterDescription.where("publisher_journalposter_id = ?", publisher_journalposter.id)        
          
          if publisher_journalposter_descriptions.any?
            
              publisher_journalposter_description = publisher_journalposter_descriptions[0]
                    
              n_section_1 = publisher_journalposter_description.cent21_learning
              n_section_2 = publisher_journalposter_description.language
              n_section_3 = publisher_journalposter_description.math
              n_section_4 = publisher_journalposter_description.science
              n_section_5 = publisher_journalposter_description.social_studies
              n_section_6 = publisher_journalposter_description.special_ed
              
              if n_section_1 == 1
                jp_count_section_1 += 1
              end
              if n_section_2 == 1
                jp_count_section_2 += 1
              end
              if n_section_3 == 1
                jp_count_section_3 += 1
              end
              if n_section_4 == 1
                jp_count_section_4 += 1
              end
              if n_section_5 == 1
                jp_count_section_5 += 1
              end
              if n_section_6 == 1
                jp_count_section_6 += 1
              end
          
          end
          
        end
      # else
        # @publisher_journalposters_count = 0
      end
  
      count_section_1 = 0
      count_section_2 = 0
      count_section_3 = 0
      count_section_4 = 0
      count_section_5 = 0
      count_section_6 = 0
      
      journal1poster_positions = Journal1posterPosition.where("id_map = ?", id_map)
      if journal1poster_positions.any?
        
        journal1poster_positions.each do|journal1poster_position|
          if (journal1poster_position.section == 1)
            count_section_1 += 1
          elsif (journal1poster_position.section == 2)
            count_section_2 += 1
          elsif (journal1poster_position.section == 3)
            count_section_3 += 1
          elsif (journal1poster_position.section == 4)
            count_section_4 += 1
          elsif (journal1poster_position.section == 5)
            count_section_5 += 1
          elsif (journal1poster_position.section == 6)
            count_section_6 += 1
          end
          
        end  
      # else
        # @journal1poster_positions_count = 0
      end


      log_available_posters = LogAvailablePoster.where("id_map = ?", id_map)
      # b = false
      if log_available_posters.any?
        log_available_poster = log_available_posters[0]
        
        if( ((count_section_1 - jp_count_section_1) <= 0) or 
            ((count_section_2 - jp_count_section_2) <= 0) or
            ((count_section_3 - jp_count_section_3) <= 0) or
            ((count_section_4 - jp_count_section_4) <= 0) or
            ((count_section_5 - jp_count_section_5) <= 0) or
            ((count_section_6 - jp_count_section_6) <= 0) )       
              
          log_available_poster.closed = true
          
        else
          log_available_poster.closed = false
        end
        
        log_available_poster.save
        
      end

      
    end
      

end
