class Journal1posterPositionsController < ApplicationController

  layout 'journalposter'

  before_filter :force_http




  def index

    @id_map = 1
    @publisher_journalposters_count = 0
    @journal1poster_positions_count = 0

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
    @jp_count_section_1 = 0
    @jp_count_section_2 = 0
    @jp_count_section_3 = 0
    @jp_count_section_4 = 0
    @jp_count_section_5 = 0
    @jp_count_section_6 = 0

    publisher_journalposters = PublisherJournalposter.where("id_map = ?", @id_map)    
    if publisher_journalposters.any?
      @publisher_journalposters_count = publisher_journalposters.count

      n_section_1 = 0
      n_section_2 = 0
      n_section_3 = 0
      n_section_4 = 0
      n_section_5 = 0
      n_section_6 = 0
            
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

    @jp_count_section_1 = jp_count_section_1
    @jp_count_section_2 = jp_count_section_2
    @jp_count_section_3 = jp_count_section_3
    @jp_count_section_4 = jp_count_section_4
    @jp_count_section_5 = jp_count_section_5
    @jp_count_section_6 = jp_count_section_6


    count_section_1 = 0
    count_section_2 = 0
    count_section_3 = 0
    count_section_4 = 0
    count_section_5 = 0
    count_section_6 = 0
    @count_section_1 = 0
    @count_section_2 = 0
    @count_section_3 = 0
    @count_section_4 = 0
    @count_section_5 = 0
    @count_section_6 = 0
    
    journal1poster_positions = Journal1posterPosition.where("id_map = ?", @id_map)
    if journal1poster_positions.any?
      @journal1poster_positions_count = journal1poster_positions.count
      
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

    @count_section_1 = count_section_1 
    @count_section_2 = count_section_2 
    @count_section_3 = count_section_3 
    @count_section_4 = count_section_4
    @count_section_5 = count_section_5
    @count_section_6 = count_section_6


    
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

      # respond_to do |format|
        # format.js { redirect_to(:action => 'index', :form => :js ) }
        # format.html
      # end
      
  end


  def delete
  end


  def destroy
  end



  private

    def journal1poster_position_params
      params.require(:journal1poster_position).permit(      
                                                      :id_map,   
                                                      :pos_x,      
                                                      :pos_y,
                                                      :section,
                                                      :section_text,
                                                      :section_pos,
                                                      :created_at, 
                                                      :updated_at 
                                                     )
                                        
    end


    
end
