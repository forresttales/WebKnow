module LogAvailablePostersHelper
  
    def log_available_posters
      
      return false
      
      # @id_map = 1
      # @publisher_journalposters_count = 0
      # @journal1poster_positions_count = 0
#   
      # section_1 = 0
      # section_2 = 0
      # section_3 = 0
      # section_4 = 0
      # section_5 = 0
      # section_6 = 0
#   
      # @jp_count_section_1 = 0
      # @jp_count_section_2 = 0
      # @jp_count_section_3 = 0
      # @jp_count_section_4 = 0
      # @jp_count_section_5 = 0
      # @jp_count_section_6 = 0
#   
      # publisher_journalposters = PublisherJournalposter.where("id_map = ?", @id_map)    
      # if publisher_journalposters.any?
        # @publisher_journalposters_count = publisher_journalposters.count
#         
        # publisher_journalposters.each do|publisher_journalposter|
#           
          # n_section_1 = publisher_journalposter_description.cent21_learning
          # n_section_2 = publisher_journalposter_description.language
          # n_section_3 = publisher_journalposter_description.math
          # n_section_4 = publisher_journalposter_description.science
          # n_section_5 = publisher_journalposter_description.social_studies
          # n_section_6 = publisher_journalposter_description.special_ed
#           
          # if n_section_1 == 1
            # @jp_count_section_1 += 1
          # end
          # if n_section_2 == 2
            # @jp_count_section_1 += 1
          # end
          # if n_section_3 == 3
            # @jp_count_section_1 += 1
          # end
          # if n_section_4 == 4
            # @jp_count_section_1 += 1
          # end
          # if n_section_5 == 5
            # @jp_count_section_1 += 1
          # end
          # if n_section_6 == 6
            # @jp_count_section_1 += 1
          # end
#           
        # end
#         
      # # else
        # # @publisher_journalposters_count = 0
      # end
#   
      # # journal1poster_positions = Journal1posterPosition.where("id_map = ?", @id_map).order(section: :asc)
      # # @publisher_journalposter_descriptions = PublisherJournalposterDescription.where("publisher_journalposter_id = ?", @@publisher_journalposter_id)
#   
#   
      # # :has_purchase,
      # # :purchase_date,
      # # :poster,
      # # :poster_text,
      # # :poster_type, #integer 1 to 5
      # # :id_map,
      # # :created_at,
      # # :updated_at 
#   
      # a_jp_1 = Array.new
      # a_jp_2 = Array.new
      # a_jp_3 = Array.new
      # a_jp_4 = Array.new
      # a_jp_5 = Array.new
      # a_jp_6 = Array.new
      # @count_section_1 = 0
      # @count_section_2 = 0
      # @count_section_3 = 0
      # @count_section_4 = 0
      # @count_section_5 = 0
      # @count_section_6 = 0
#       
      # journal1poster_positions = Journal1posterPosition.where("id_map = ?", @id_map)
      # if journal1poster_positions.any?
        # @journal1poster_positions_count = journal1poster_positions.count
#         
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
#           
        # end  
      # # else
        # # @journal1poster_positions_count = 0
      # end
#   
      # @count_section_1 = a_jp_1.count 
      # @count_section_2 = a_jp_2.count 
      # @count_section_3 = a_jp_3.count 
      # @count_section_4 = a_jp_4.count 
      # @count_section_5 = a_jp_5.count 
      # @count_section_6 = a_jp_6.count 
      
    end


  
end
