class Journal1postersController < ApplicationController
  
  # layout 'journalposter'

  # before_filter :force_http

  layout :resolve_layout
  
  # layout :determine_layout  
  # def determine_layout
    # if index_demo
      # "journal1poster_demo"
    # else
      # "journal1poster"
    # end
  # end



  def index
    
    
    gon.selected = 1
    
    @publisher_ad_pins = PublisherAdPin.all
    
    @publisher_ad_squares = PublisherAdSquare.all
    
    
    
    
    
    
    
    
    
    
    
    
    #  curriculum_resources       
    #  teacher_tools              
    #  school_operations       
    #  content                  
    #  prof_learning  
    
    # cent21_learning    assmt_testing         learning_mgmt_systs   apps                subscrip_sites            
    # language           collaboration         student_info_systs    digit_textbooks     ebook_game_creat        
    # math               classroom_resp        web_filtering         games               digit_story_poster
    # science            grading_atten         device_mgmt           study_tools         courseware
    # social_studies     lesson_planning       virtual_dist_ed       video               talent_mgmt
    # special_ed         pres_tools            testing_systs         dictionaries        prof_devel_systems
    #                    lecture_capture       unique_tech           directories         instr_design
    #                    plag_checks                                                     other_diy
    
    # poster_type
    # poster_coord_id
    
    # Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumyeirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diamvolupt
    
    
    
    
    
    
    # @id_map = 1
    # publisher_journalposters = PublisherJournalposter.where("id_map = ?", @id_map).order(created_at: :asc)    
    # journal1poster_positions = Journal1posterPosition.where("id_map = ?", @id_map).order(section: :asc)
    # a_jp_poster_12 = Array.new
    # a_jp_poster_34 = Array.new
    # a_jp_map = Array.new
    # a_jp_1 = Array.new
    # a_jp_2 = Array.new
    # a_jp_3 = Array.new
    # a_jp_4 = Array.new
    # a_jp_5 = Array.new
    # a_jp_6 = Array.new
    # a_jpp_section_1 = Array.new
    # a_jpp_section_2 = Array.new
    # a_jpp_section_3 = Array.new
    # a_jpp_section_4 = Array.new
    # a_jpp_section_5 = Array.new
    # a_jpp_section_6 = Array.new
    # id_div = 1
    # # array = [["happy", 1], ["sad", 2], ["mad", 1], ["bad", 3], ["glad", 12]]    asc
    # # sorted = array.sort {|a,b| a[1] <=> b[1]}
    # # array = [["happy", 1], ["sad", 2], ["mad", 1], ["bad", 3], ["glad", 12]]    desc
    # # sorted = array.sort {|a,b| b[1] <=> a[1]}    
    # journal1poster_positions.sort! {|a, b| a.section <=> b.section}
    # journal1poster_positions.each do|journal1poster_position|
      # if (journal1poster_position.section == 1)
        # a_jp_1.push(journal1poster_position)
      # elsif (journal1poster_position.section == 2)
        # a_jp_2.push(journal1poster_position)
      # elsif (journal1poster_position.section == 3)
        # a_jp_3.push(journal1poster_position)
      # elsif (journal1poster_position.section == 4)
        # a_jp_4.push(journal1poster_position)
      # elsif (journal1poster_position.section == 5)
        # a_jp_5.push(journal1poster_position)
      # elsif (journal1poster_position.section == 6)
        # a_jp_6.push(journal1poster_position)
      # end
    # end  
    # a_jp_1.sort! {|a,b| b.section_pos <=> a.section_pos}
    # a_jp_2.sort! {|a,b| b.section_pos <=> a.section_pos}
    # a_jp_3.sort! {|a,b| b.section_pos <=> a.section_pos}
    # a_jp_4.sort! {|a,b| b.section_pos <=> a.section_pos}
    # a_jp_5.sort! {|a,b| b.section_pos <=> a.section_pos}
    # a_jp_6.sort! {|a,b| b.section_pos <=> a.section_pos}
    # a_jp_1.each do|a|
      # a_jpp_section_1.push([a.pos_x, a.pos_y])
    # end  
    # a_jp_2.each do|a|
      # a_jpp_section_2.push([a.pos_x, a.pos_y])
    # end  
    # a_jp_3.each do|a|
      # a_jpp_section_3.push([a.pos_x, a.pos_y])
    # end  
    # a_jp_4.each do|a|
      # a_jpp_section_4.push([a.pos_x, a.pos_y])
    # end  
    # a_jp_5.each do|a|
      # a_jpp_section_5.push([a.pos_x, a.pos_y])
    # end  
    # a_jp_6.each do|a|
      # a_jpp_section_6.push([a.pos_x, a.pos_y])
    # end  
    # # journal1poster_positions.each do|journal1poster_position|
      # # if (journal1poster_position.section == 3)
        # # a_jpp_section_3.push([journal1poster_position.pos_x, journal1poster_position.pos_y])
      # # elsif (journal1poster_position.section == 4)
        # # a_jpp_section_4.push([journal1poster_position.pos_x, journal1poster_position.pos_y])
      # # end
    # # end  
    # # for i in 0..(publisher_journalposters.count - 1)
    # publisher_journalposters.each do|publisher_journalposter|
      # poster = publisher_journalposter.poster
      # publisher_journalposter_descriptions = PublisherJournalposterDescription.where("publisher_journalposter_id = ?", publisher_journalposter.id)
      # publisher_journalposter_description = publisher_journalposter_descriptions[0]
      # publisher_journalposter_logos_any = false
      # publisher_journalposter_logo = nil
      # publisher_journalposter_logos = PublisherJournalposterLogo.where("publisher_journalposter_id = ?", publisher_journalposter.id)
      # if publisher_journalposter_logos.any?
        # publisher_journalposter_logos_any = true
        # publisher_journalposter_logo_140_100 = publisher_journalposter_logos[0].image_url(:logo_140_100)
        # publisher_journalposter_logo_200_70 = publisher_journalposter_logos[0].image_url(:logo_200_70)        
      # else
        # # publisher_journalposter_logos_any = false        
        # # publisher_journalposter_logo = nil
      # end
      # publisher_journalposter_prodshots_any = false
      # publisher_journalposter_prodshot = "no prod shot"
      # if ((poster == 3) or (poster == 4))
        # publisher_journalposter_prodshots = PublisherJournalposterProdshot.where("publisher_journalposter_id = ?", publisher_journalposter.id)
        # if publisher_journalposter_prodshots.any?
          # publisher_journalposter_prodshots_any = true
          # publisher_journalposter_prodshot = publisher_journalposter_prodshots[0].image_url(:logo_140_100)
        # else
          # # publisher_journalposter_prodshots_any = false        
          # # publisher_journalposter_prodshot = nil
        # end
      # else
        # #
      # end
      # url = publisher_journalposter_description.url
      # tag_line = publisher_journalposter_description.tag_line        
      # word_descr = publisher_journalposter_description.word_descr        
      # publisher_journalposter_id = publisher_journalposter.id        
      # # [0] publisher_journalposter_id
      # # [1] tag_line
      # # [2] url
      # # [3] publisher_journalposter_logos_any
      # # [4] publisher_journalposter_logo
      # # [5] word_descr
      # # [6] publisher_journalposter_prodshots_any
      # # [7] publisher_journalposter_prodshot
      # # [8] headline
      # headline = ""
      # if ((poster == 3) or (poster == 4))
        # headline = publisher_journalposter_description.headline  
        # a_jp_poster_34.push([publisher_journalposter_id, tag_line, url, publisher_journalposter_logos_any, publisher_journalposter_logo_140_100, word_descr, publisher_journalposter_prodshots_any, publisher_journalposter_prodshot, headline])        
      # else
        # a_jp_poster_12.push([publisher_journalposter_id, tag_line, url, publisher_journalposter_logos_any, publisher_journalposter_logo_140_100, word_descr])        
      # end    
      # # 1 cent21_learning               
      # # 2 language                  
      # # 3 math              
      # # 4 science           
      # # 5 social_studies    
      # # 6 special_ed        
      # n_section_1 = publisher_journalposter_description.cent21_learning
      # n_section_2 = publisher_journalposter_description.language
      # n_section_3 = publisher_journalposter_description.math
      # n_section_4 = publisher_journalposter_description.science
      # n_section_5 = publisher_journalposter_description.social_studies
      # n_section_6 = publisher_journalposter_description.special_ed
      # # [0] a_jpp_section_3.pop
      # # [1] tag_line
      # # [2] url
      # # [3] id_div
      # # [4] "Math Country"
      # # [5] publisher_journalposter_logos_any
      # # [6] publisher_journalposter_logo
      # # [7] word_descr
      # # [8] publisher_journalposter_id
      # if n_section_1 == 1
        # if a_jpp_section_1.count > 0
          # a_jp_map.push([a_jpp_section_1.pop, tag_line, url, id_div, "cent21_learning", publisher_journalposter_logos_any, publisher_journalposter_logo_200_70, publisher_journalposter_id])
          # id_div += id_div
        # end
      # end
      # if n_section_2 == 1
        # if a_jpp_section_2.count > 0
          # a_jp_map.push([a_jpp_section_2.pop, tag_line, url, id_div, "language", publisher_journalposter_logos_any, publisher_journalposter_logo_200_70, publisher_journalposter_id])
          # id_div += id_div
        # end
      # end
      # if n_section_3 == 1
        # if a_jpp_section_3.count > 0
          # a_jp_map.push([a_jpp_section_3.pop, tag_line, url, id_div, "math", publisher_journalposter_logos_any, publisher_journalposter_logo_200_70, publisher_journalposter_id])
          # id_div += id_div
        # end
      # end
      # if n_section_4 == 1
        # if a_jpp_section_4.count > 0
          # a_jp_map.push([a_jpp_section_4.pop, tag_line, url, id_div, "science", publisher_journalposter_logos_any, publisher_journalposter_logo_200_70, publisher_journalposter_id])
          # id_div += id_div
        # end
      # end
      # if n_section_5 == 1
        # if a_jpp_section_5.count > 0
          # a_jp_map.push([a_jpp_section_5.pop, tag_line, url, id_div, "social_studies", publisher_journalposter_logos_any, publisher_journalposter_logo_200_70, publisher_journalposter_id])
          # id_div += id_div
        # end
      # end
      # if n_section_6 == 1
        # if a_jpp_section_6.count > 0
          # a_jp_map.push([a_jpp_section_6.pop, tag_line, url, id_div, "special_ed", publisher_journalposter_logos_any, publisher_journalposter_logo_200_70, publisher_journalposter_id])
          # id_div += id_div
        # end
      # end
    # end
    # # render text: a_jp[0][2]
    # gon.selected = 1
    # @cnt_12 = 0
    # @cnt_34 = 0
    # @journal1posters_12 = a_jp_poster_12    
    # @journal1posters_34 = a_jp_poster_34    
    # @journal1posters_map = a_jp_map
    # # @testposters = 4
    # # render text: publisher_journalposter_prodshot
  end
  
  
  def index_demo
      # render :layout => 'journalposter_demo'
  end

  
  def new
  end

  
  def create
  end


  def edit
  end
  
  
  def update
  end


  def dbdelete

      Journal1posterPosition.dbdelete
      Journal1posterPosition.dbclear

      redirect_to :action => 'index'
      
  end


  def delete
  end


  def destroy
  end



  private

    def journal1poster_params
      params.require(:journal1poster).permit(      
                                              :id_user,                  
                                              :publisher_id,              
                                              :publisher_journalposter_id, 
                                              :pos_map,            
                                              :url,                       
                                              :main_sales_phone,          
                                              :created_at,                
                                              :updated_at  
                                            )
                                        
    end

  
    def resolve_layout
      case action_name
        when 'index_demo'
          'journalposter_demo'
        else
          'journalposter'
      end
    end

  
    
end
