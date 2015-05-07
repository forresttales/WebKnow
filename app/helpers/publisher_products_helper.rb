module PublisherProductsHelper


  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end


  def yesno(x)
    x ? "Yes" : "No"
  end


  def product_tagline_for(publisher_product)
    
      product_tagline_text = []
      publisher_product_manifest = publisher_product.publisher_product_manifest rescue nil
      if !publisher_product_manifest.nil? 
          product_tagline_text.push(publisher_product_manifest.product_tagline)
      end    
      
      h_product_tagline = Hash.new
      h_product_tagline[:product_tagline_text] = product_tagline_text

      return h_product_tagline      
  end  

  def name_product_for(publisher_product)
      
      name_product_text = []
      publisher_product_manifest = publisher_product.publisher_product_manifest rescue nil
      if !publisher_product_manifest.nil? 
          name_product_text.push(publisher_product_manifest.name_product)
      end    
      
      h_name_product = Hash.new
      h_name_product[:name_product_text] = name_product_text

      return h_name_product      
  end  

  def versions_for(publisher_product)
    
      versions_text = []
      publisher_product_manifest = publisher_product.publisher_product_manifest rescue nil
      if !publisher_product_manifest.nil? 
          versions_text.push(publisher_product_manifest.versions)
      end    
      
      h_versions = Hash.new
      h_versions[:versions_text] = versions_text

      return h_versions
  end  

  def category_subject_for(publisher_product)
      
      a_category_subjects = Array.new
      category_subjects = return_all_dtab4lets
      category_subjects.each do |category_subject|
        a_category_subjects.push(category_subject)
      end

      # gon_category_subject = []    
      category_subject_text = []    
      # b_category_subject_other = false
      has_category_subject_other = false
      category_subject_other = ""
      
      publisher_product_category_subject = publisher_product.publisher_product_category_subject rescue nil
      if !publisher_product_category_subject.nil?

          if publisher_product_category_subject.category_subject_other_b      
              # b_category_subject_other = true
              has_category_subject_other = true
              category_subject_other = publisher_product_category_subject.category_subject_other            
          end

          if (publisher_product_category_subject.category_subject_1 or
              publisher_product_category_subject.category_subject_2 or
              publisher_product_category_subject.category_subject_3 or
              publisher_product_category_subject.category_subject_4 or
              publisher_product_category_subject.category_subject_5 or
              publisher_product_category_subject.category_subject_6 or
              publisher_product_category_subject.category_subject_7 or
              publisher_product_category_subject.category_subject_8 or
              publisher_product_category_subject.category_subject_9 or
              publisher_product_category_subject.category_subject_10 or
              publisher_product_category_subject.category_subject_11 or
              publisher_product_category_subject.category_subject_12 or
              publisher_product_category_subject.category_subject_13 or
              publisher_product_category_subject.category_subject_14 or
              publisher_product_category_subject.category_subject_15 or
              publisher_product_category_subject.category_subject_16 or
              publisher_product_category_subject.category_subject_17 or
              publisher_product_category_subject.category_subject_18 or
              publisher_product_category_subject.category_subject_19 or
              publisher_product_category_subject.category_subject_20 or
              publisher_product_category_subject.category_subject_21 or
              publisher_product_category_subject.category_subject_22 or
              publisher_product_category_subject.category_subject_23 or
              publisher_product_category_subject.category_subject_24 or
              publisher_product_category_subject.category_subject_25 or
              publisher_product_category_subject.category_subject_26 or
              publisher_product_category_subject.category_subject_27 or
              publisher_product_category_subject.category_subject_28 or
              publisher_product_category_subject.category_subject_29 or
              publisher_product_category_subject.category_subject_30 or
              publisher_product_category_subject.category_subject_31 or
              publisher_product_category_subject.category_subject_32 or
              publisher_product_category_subject.category_subject_33 or
              publisher_product_category_subject.category_subject_34 or
              publisher_product_category_subject.category_subject_35 or
              publisher_product_category_subject.category_subject_36 or
              publisher_product_category_subject.category_subject_37 or
              publisher_product_category_subject.category_subject_38 or
              publisher_product_category_subject.category_subject_39)
              
              b = publisher_product_category_subject.category_subject_1
              if b
                category_subject_text.push(a_category_subjects[0].col_1)                            
              end        
              b = publisher_product_category_subject.category_subject_2
              if b
                category_subject_text.push(a_category_subjects[1].col_1)                            
              end        
              b = publisher_product_category_subject.category_subject_3
              if b
                category_subject_text.push(a_category_subjects[2].col_1)                                                    
              end        
              b = publisher_product_category_subject.category_subject_4
              if b
                category_subject_text.push(a_category_subjects[3].col_1)                                                    
              end        
              b = publisher_product_category_subject.category_subject_5
              if b
                category_subject_text.push(a_category_subjects[4].col_1)  
              end        
              b = publisher_product_category_subject.category_subject_6
              if b
                category_subject_text.push(a_category_subjects[5].col_1)  
              end        
              b = publisher_product_category_subject.category_subject_7
              if b
                category_subject_text.push(a_category_subjects[6].col_1)  
              end        
              b = publisher_product_category_subject.category_subject_8
              if b
                category_subject_text.push(a_category_subjects[7].col_1)  
              end        
              b = publisher_product_category_subject.category_subject_9
              if b
                category_subject_text.push(a_category_subjects[8].col_1)  
              end        
              b = publisher_product_category_subject.category_subject_10
              if b
                category_subject_text.push(a_category_subjects[9].col_1)  
              end        
              b = publisher_product_category_subject.category_subject_11
              if b
                category_subject_text.push(a_category_subjects[10].col_1)  
              end        
              b = publisher_product_category_subject.category_subject_12
              if b
                category_subject_text.push(a_category_subjects[11].col_1)  
              end        
              b = publisher_product_category_subject.category_subject_13
              if b
                category_subject_text.push(a_category_subjects[12].col_1)  
              end        
              b = publisher_product_category_subject.category_subject_14
              if b
                category_subject_text.push(a_category_subjects[13].col_1)  
              end        
              b = publisher_product_category_subject.category_subject_15
              if b
                category_subject_text.push(a_category_subjects[14].col_1)  
              end        
              b = publisher_product_category_subject.category_subject_16
              if b
                category_subject_text.push(a_category_subjects[15].col_1)  
              end        
              b = publisher_product_category_subject.category_subject_17
              if b
                category_subject_text.push(a_category_subjects[16].col_1)  
              end        
              b = publisher_product_category_subject.category_subject_18
              if b
                category_subject_text.push(a_category_subjects[17].col_1)  
              end        
              b = publisher_product_category_subject.category_subject_19
              if b
                category_subject_text.push(a_category_subjects[18].col_1)  
              end        
              b = publisher_product_category_subject.category_subject_20
              if b
                category_subject_text.push(a_category_subjects[19].col_1)  
              end        
              b = publisher_product_category_subject.category_subject_21
              if b
                category_subject_text.push(a_category_subjects[20].col_1)  
              end        
              b = publisher_product_category_subject.category_subject_22
              if b
                category_subject_text.push(a_category_subjects[21].col_1)  
              end        
              b = publisher_product_category_subject.category_subject_23
              if b
                category_subject_text.push(a_category_subjects[22].col_1)  
              end        
              b = publisher_product_category_subject.category_subject_24
              if b
                category_subject_text.push(a_category_subjects[23].col_1)  
              end        
              b = publisher_product_category_subject.category_subject_25
              if b
                category_subject_text.push(a_category_subjects[24].col_1)  
              end        
              b = publisher_product_category_subject.category_subject_26
              if b
                category_subject_text.push(a_category_subjects[25].col_1)  
              end        
              b = publisher_product_category_subject.category_subject_27
              if b
                category_subject_text.push(a_category_subjects[26].col_1)  
              end        
              b = publisher_product_category_subject.category_subject_28
              if b
                category_subject_text.push(a_category_subjects[27].col_1)  
              end        
              b = publisher_product_category_subject.category_subject_29
              if b
                category_subject_text.push(a_category_subjects[28].col_1)  
              end        
              b = publisher_product_category_subject.category_subject_30
              if b
                category_subject_text.push(a_category_subjects[29].col_1)  
              end        
              b = publisher_product_category_subject.category_subject_31
              if b
                category_subject_text.push(a_category_subjects[30].col_1)  
              end        
              b = publisher_product_category_subject.category_subject_32
              if b
                category_subject_text.push(a_category_subjects[31].col_1)  
              end        
              b = publisher_product_category_subject.category_subject_33
              if b
                category_subject_text.push(a_category_subjects[32].col_1)  
              end        
              b = publisher_product_category_subject.category_subject_34
              if b
                category_subject_text.push(a_category_subjects[33].col_1)  
              end        
              b = publisher_product_category_subject.category_subject_35
              if b
                category_subject_text.push(a_category_subjects[34].col_1)  
              end        
              b = publisher_product_category_subject.category_subject_36
              if b
                category_subject_text.push(a_category_subjects[35].col_1)  
              end        
              b = publisher_product_category_subject.category_subject_37
              if b
                category_subject_text.push(a_category_subjects[36].col_1)  
              end        
              b = publisher_product_category_subject.category_subject_38
              if b
                category_subject_text.push(a_category_subjects[37].col_1)  
              end        
              b = publisher_product_category_subject.category_subject_39
              if b
                category_subject_text.push(a_category_subjects[38].col_1)  
              end        
          end
      else
          Rails.logger.info("publisher_product_category_subject was nil")
      end
      
      h_category_subject = Hash.new
      h_category_subject[:category_subject_text] = category_subject_text
      h_category_subject[:has_category_subject_other] = has_category_subject_other
      h_category_subject[:category_subject_other] = category_subject_other
      
      return h_category_subject    
  end



  def age_range_for(publisher_product)
    
      a_from_ages = Array.new
      from_ages = return_all_dtab8lets
      from_ages.each do |from_age|
        a_from_ages.push(from_age)
      end
      from_age_text = []    
      publisher_product_from_age = publisher_product.publisher_product_from_age rescue nil
      if !publisher_product_from_age.nil? 
          if (publisher_product_from_age.age_1 or
              publisher_product_from_age.age_2 or
              publisher_product_from_age.age_3 or
              publisher_product_from_age.age_4 or
              publisher_product_from_age.age_5 or
              publisher_product_from_age.age_6 or
              publisher_product_from_age.age_7 or
              publisher_product_from_age.age_8 or
              publisher_product_from_age.age_9 or
              publisher_product_from_age.age_10 or
              publisher_product_from_age.age_11 or
              publisher_product_from_age.age_12 or
              publisher_product_from_age.age_13 or
              publisher_product_from_age.age_14 or
              publisher_product_from_age.age_15 or
              publisher_product_from_age.age_16 or
              publisher_product_from_age.age_17 or
              publisher_product_from_age.age_18 or
              publisher_product_from_age.age_19 or
              publisher_product_from_age.age_20)
              
              b = publisher_product_from_age.age_1
              if b
                from_age_text.push(a_from_ages[0].col_1)                            
              end        
              b = publisher_product_from_age.age_2
              if b
                from_age_text.push(a_from_ages[1].col_1)                            
              end        
              b = publisher_product_from_age.age_3
              if b
                from_age_text.push(a_from_ages[2].col_1)                            
              end        
              b = publisher_product_from_age.age_4
              if b
                from_age_text.push(a_from_ages[3].col_1)                            
              end        
              b = publisher_product_from_age.age_5
              if b
                from_age_text.push(a_from_ages[4].col_1)                            
              end        
              b = publisher_product_from_age.age_6
              if b
                from_age_text.push(a_from_ages[5].col_1)                            
              end        
              b = publisher_product_from_age.age_7
              if b
                from_age_text.push(a_from_ages[6].col_1)                            
              end        
              b = publisher_product_from_age.age_8
              if b
                from_age_text.push(a_from_ages[7].col_1)                            
              end        
              b = publisher_product_from_age.age_9
              if b
                from_age_text.push(a_from_ages[8].col_1)                            
              end        
              b = publisher_product_from_age.age_10
              if b
                from_age_text.push(a_from_ages[9].col_1)                            
              end        
              b = publisher_product_from_age.age_11
              if b
                from_age_text.push(a_from_ages[10].col_1)                            
              end        
              b = publisher_product_from_age.age_12
              if b
                from_age_text.push(a_from_ages[11].col_1)                            
              end        
              b = publisher_product_from_age.age_13
              if b
                from_age_text.push(a_from_ages[12].col_1)                            
              end        
              b = publisher_product_from_age.age_14
              if b
                from_age_text.push(a_from_ages[13].col_1)                            
              end        
              b = publisher_product_from_age.age_15
              if b
                from_age_text.push(a_from_ages[14].col_1)                            
              end        
              b = publisher_product_from_age.age_16
              if b
                from_age_text.push(a_from_ages[15].col_1)                            
              end        
              b = publisher_product_from_age.age_17
              if b
                from_age_text.push(a_from_ages[16].col_1)                            
              end        
              b = publisher_product_from_age.age_18
              if b
                from_age_text.push(a_from_ages[17].col_1)                            
              end        
              b = publisher_product_from_age.age_19
              if b
                from_age_text.push(a_from_ages[18].col_1)                            
              end        
              b = publisher_product_from_age.age_20
              if b
                from_age_text.push(a_from_ages[19].col_1)                            
              end        
          end
      else
          Rails.logger.info("publisher_product_from_age was nil")
      end
      

      a_to_ages = Array.new
      to_ages = return_all_dtab8lets
      to_ages.each do |to_age|
        a_to_ages.push(to_age)
      end
      to_age_text = []    
      publisher_product_to_age = publisher_product.publisher_product_to_age rescue nil
      if !publisher_product_to_age.nil?
          if (publisher_product_to_age.age_1 or
              publisher_product_to_age.age_2 or
              publisher_product_to_age.age_3 or
              publisher_product_to_age.age_4 or
              publisher_product_to_age.age_5 or
              publisher_product_to_age.age_6 or
              publisher_product_to_age.age_7 or
              publisher_product_to_age.age_8 or
              publisher_product_to_age.age_9 or
              publisher_product_to_age.age_10 or
              publisher_product_to_age.age_11 or
              publisher_product_to_age.age_12 or
              publisher_product_to_age.age_13 or
              publisher_product_to_age.age_14 or
              publisher_product_to_age.age_15 or
              publisher_product_to_age.age_16 or
              publisher_product_to_age.age_17 or
              publisher_product_to_age.age_18 or
              publisher_product_to_age.age_19 or
              publisher_product_to_age.age_20)
              
              b = publisher_product_to_age.age_1
              if b
                to_age_text.push(a_to_ages[0].col_1)                            
              end        
              b = publisher_product_to_age.age_2
              if b
                to_age_text.push(a_to_ages[1].col_1)                            
              end        
              b = publisher_product_to_age.age_3
              if b
                to_age_text.push(a_to_ages[2].col_1)                            
              end        
              b = publisher_product_to_age.age_4
              if b
                to_age_text.push(a_to_ages[3].col_1)                            
              end        
              b = publisher_product_to_age.age_5
              if b
                to_age_text.push(a_to_ages[4].col_1)                            
              end        
              b = publisher_product_to_age.age_6
              if b
                to_age_text.push(a_to_ages[5].col_1)                            
              end        
              b = publisher_product_to_age.age_7
              if b
                to_age_text.push(a_to_ages[6].col_1)                            
              end        
              b = publisher_product_to_age.age_8
              if b
                to_age_text.push(a_to_ages[7].col_1)                            
              end        
              b = publisher_product_to_age.age_9
              if b
                to_age_text.push(a_to_ages[8].col_1)                            
              end        
              b = publisher_product_to_age.age_10
              if b
                to_age_text.push(a_to_ages[9].col_1)                            
              end        
              b = publisher_product_to_age.age_11
              if b
                to_age_text.push(a_to_ages[10].col_1)                            
              end        
              b = publisher_product_to_age.age_12
              if b
                to_age_text.push(a_to_ages[11].col_1)                            
              end        
              b = publisher_product_to_age.age_13
              if b
                to_age_text.push(a_to_ages[12].col_1)                            
              end        
              b = publisher_product_to_age.age_14
              if b
                to_age_text.push(a_to_ages[13].col_1)                            
              end        
              b = publisher_product_to_age.age_15
              if b
                to_age_text.push(a_to_ages[14].col_1)                            
              end        
              b = publisher_product_to_age.age_16
              if b
                to_age_text.push(a_to_ages[15].col_1)                            
              end        
              b = publisher_product_to_age.age_17
              if b
                to_age_text.push(a_to_ages[16].col_1)                            
              end        
              b = publisher_product_to_age.age_18
              if b
                to_age_text.push(a_to_ages[17].col_1)                            
              end        
              b = publisher_product_to_age.age_19
              if b
                to_age_text.push(a_to_ages[18].col_1)                            
              end        
              b = publisher_product_to_age.age_20
              if b
                to_age_text.push(a_to_ages[19].col_1)                            
              end        
          end
      else
          Rails.logger.info("publisher_product_to_age was nil")
      end
      
      f = ""
      t = ""      
      if (from_age_text.length > 0)
          f = from_age_text[0]
      end
      if (to_age_text.length > 0)
          t = to_age_text[0]
      end
      
      age_range_text = []
      if ((f.length > 0) and (t.length > 0))
        age_range_text.push(f + ' to ' + t);
      elsif ((f.length > 0) and !(t.length > 0))
        age_range_text.push(f);
      end
      
      h_age_range = Hash.new
      h_age_range[:age_range_text] = age_range_text
      
      return h_age_range
  end


  def grade_range_for(publisher_product)
    
      a_from_grades = Array.new
      from_grades = return_all_dtab9lets
      from_grades.each do |from_grade|
        a_from_grades.push(from_grade)
      end
      from_grade_text = []    
      publisher_product_from_grade = publisher_product.publisher_product_from_grade rescue nil
      if !publisher_product_from_grade.nil? 
          if (publisher_product_from_grade.grade_1 or
              publisher_product_from_grade.grade_2 or
              publisher_product_from_grade.grade_3 or
              publisher_product_from_grade.grade_4 or
              publisher_product_from_grade.grade_5 or
              publisher_product_from_grade.grade_6 or
              publisher_product_from_grade.grade_7 or
              publisher_product_from_grade.grade_8 or
              publisher_product_from_grade.grade_9 or
              publisher_product_from_grade.grade_10 or
              publisher_product_from_grade.grade_11 or
              publisher_product_from_grade.grade_12 or
              publisher_product_from_grade.grade_13 or
              publisher_product_from_grade.grade_14 or
              publisher_product_from_grade.grade_15 or
              publisher_product_from_grade.grade_16)
              
              b = publisher_product_from_grade.grade_1
              if b
                from_grade_text.push(a_from_grades[0].col_1)                            
              end        
              b = publisher_product_from_grade.grade_2
              if b
                from_grade_text.push(a_from_grades[1].col_1)                            
              end        
              b = publisher_product_from_grade.grade_3
              if b
                from_grade_text.push(a_from_grades[2].col_1)                            
              end        
              b = publisher_product_from_grade.grade_4
              if b
                from_grade_text.push(a_from_grades[3].col_1)                            
              end        
              b = publisher_product_from_grade.grade_5
              if b
                from_grade_text.push(a_from_grades[4].col_1)                            
              end        
              b = publisher_product_from_grade.grade_6
              if b
                from_grade_text.push(a_from_grades[5].col_1)                            
              end        
              b = publisher_product_from_grade.grade_7
              if b
                from_grade_text.push(a_from_grades[6].col_1)                            
              end        
              b = publisher_product_from_grade.grade_8
              if b
                from_grade_text.push(a_from_grades[7].col_1)                            
              end        
              b = publisher_product_from_grade.grade_9
              if b
                from_grade_text.push(a_from_grades[8].col_1)                            
              end        
              b = publisher_product_from_grade.grade_10
              if b
                from_grade_text.push(a_from_grades[9].col_1)                            
              end        
              b = publisher_product_from_grade.grade_11
              if b
                from_grade_text.push(a_from_grades[10].col_1)                            
              end        
              b = publisher_product_from_grade.grade_12
              if b
                from_grade_text.push(a_from_grades[11].col_1)                            
              end        
              b = publisher_product_from_grade.grade_13
              if b
                from_grade_text.push(a_from_grades[12].col_1)                            
              end        
              b = publisher_product_from_grade.grade_14
              if b
                from_grade_text.push(a_from_grades[13].col_1)                            
              end        
              b = publisher_product_from_grade.grade_15
              if b
                from_grade_text.push(a_from_grades[14].col_1)                            
              end        
              b = publisher_product_from_grade.grade_16
              if b
                from_grade_text.push(a_from_grades[15].col_1)                            
              end        
          end
      else
          Rails.logger.info("publisher_product_from_grade was nil")
      end
      

      a_to_grades = Array.new
      to_grades = return_all_dtab9lets
      to_grades.each do |to_grade|
        a_to_grades.push(to_grade)
      end
      to_grade_text = []    
      publisher_product_to_grade = publisher_product.publisher_product_to_grade rescue nil
      if !publisher_product_to_grade.nil?
          if (publisher_product_to_grade.grade_1 or
              publisher_product_to_grade.grade_2 or
              publisher_product_to_grade.grade_3 or
              publisher_product_to_grade.grade_4 or
              publisher_product_to_grade.grade_5 or
              publisher_product_to_grade.grade_6 or
              publisher_product_to_grade.grade_7 or
              publisher_product_to_grade.grade_8 or
              publisher_product_to_grade.grade_9 or
              publisher_product_to_grade.grade_10 or
              publisher_product_to_grade.grade_11 or
              publisher_product_to_grade.grade_12 or
              publisher_product_to_grade.grade_13 or
              publisher_product_to_grade.grade_14 or
              publisher_product_to_grade.grade_15 or
              publisher_product_to_grade.grade_16)
              
              b = publisher_product_to_grade.grade_1
              if b
                to_grade_text.push(a_to_grades[0].col_1)                            
              end        
              b = publisher_product_to_grade.grade_2
              if b
                to_grade_text.push(a_to_grades[1].col_1)                            
              end        
              b = publisher_product_to_grade.grade_3
              if b
                to_grade_text.push(a_to_grades[2].col_1)                            
              end        
              b = publisher_product_to_grade.grade_4
              if b
                to_grade_text.push(a_to_grades[3].col_1)                            
              end        
              b = publisher_product_to_grade.grade_5
              if b
                to_grade_text.push(a_to_grades[4].col_1)                            
              end        
              b = publisher_product_to_grade.grade_6
              if b
                to_grade_text.push(a_to_grades[5].col_1)                            
              end        
              b = publisher_product_to_grade.grade_7
              if b
                to_grade_text.push(a_to_grades[6].col_1)                            
              end        
              b = publisher_product_to_grade.grade_8
              if b
                to_grade_text.push(a_to_grades[7].col_1)                            
              end        
              b = publisher_product_to_grade.grade_9
              if b
                to_grade_text.push(a_to_grades[8].col_1)                            
              end        
              b = publisher_product_to_grade.grade_10
              if b
                to_grade_text.push(a_to_grades[9].col_1)                            
              end        
              b = publisher_product_to_grade.grade_11
              if b
                to_grade_text.push(a_to_grades[10].col_1)                            
              end        
              b = publisher_product_to_grade.grade_12
              if b
                to_grade_text.push(a_to_grades[11].col_1)                            
              end        
              b = publisher_product_to_grade.grade_13
              if b
                to_grade_text.push(a_to_grades[12].col_1)                            
              end        
              b = publisher_product_to_grade.grade_14
              if b
                to_grade_text.push(a_to_grades[13].col_1)                            
              end        
              b = publisher_product_to_grade.grade_15
              if b
                to_grade_text.push(a_to_grades[14].col_1)                            
              end        
              b = publisher_product_to_grade.grade_16
              if b
                to_grade_text.push(a_to_grades[15].col_1)                            
              end        
          end
      else
          Rails.logger.info("publisher_product_to_grade was nil")
      end
      
      
      f = ""
      t = ""      
      if (from_grade_text.length > 0)
          f = from_grade_text[0]
      end
      if (to_grade_text.length > 0)
          t = to_grade_text[0]
      end
      
      grade_range_text = []
      if ((f.length > 0) and (t.length > 0))
        grade_range_text.push(f + ' to ' + t);
      elsif ((f.length > 0) and !(t.length > 0))
        grade_range_text.push(f);
      end
      
      h_grade_range = Hash.new
      h_grade_range[:grade_range_text] = grade_range_text
      
      return h_grade_range
  end


  def market_target_for(publisher_product)

      a_market_targets = Array.new
      @market_targets = return_all_dtab11lets
      @market_targets.each do |m_target|
        a_market_targets.push(m_target)
      end
      market_target_text = []    
      
      publisher_product_market_target = publisher_product.publisher_product_market_target rescue nil
      if !publisher_product_market_target.nil?
          if (publisher_product_market_target.market_target_1 or
              publisher_product_market_target.market_target_2)
      
              b = publisher_product_market_target.market_target_1
              if b
                market_target_text.push(a_market_targets[0].col_1)                            
              end        
              b = publisher_product_market_target.market_target_2
              if b
                market_target_text.push(a_market_targets[1].col_1)                            
              end        
          end
      else
          Rails.logger.info("publisher_product_market_target was nil")
      end

      h_market_target = Hash.new
      h_market_target[:market_target_text] = market_target_text
      
      return h_market_target
  end


  def pricing_model_for(publisher_product)
    
      a_pricing_models = Array.new
      pricing_models = return_all_dtab10lets
      pricing_models.each do |p_model|
        a_pricing_models.push(p_model)
      end
      
      pricing_model_text = []
      publisher_product_pricing_model = publisher_product.publisher_product_pricing_model rescue nil
      if !publisher_product_pricing_model.nil?
          if (publisher_product_pricing_model.pricing_model_1 or
              publisher_product_pricing_model.pricing_model_2 or
              publisher_product_pricing_model.pricing_model_3)
              
              b = publisher_product_pricing_model.pricing_model_1
              if b
                  pricing_model_text.push(a_pricing_models[0].col_1)                            
              end        
              b = publisher_product_pricing_model.pricing_model_2
              if b
                  pricing_model_text.push(a_pricing_models[1].col_1)                            
              end        
              b = publisher_product_pricing_model.pricing_model_3
              if b
                  pricing_model_text.push(a_pricing_models[2].col_1)                            
              end        
          end
      else
          Rails.logger.info("publisher_product_pricing_model was nil")
      end

      h_pricing_model = Hash.new
      h_pricing_model[:pricing_model_text] = pricing_model_text
      
      return h_pricing_model
  end



  def platform_for(publisher_product)

      a_platforms = Array.new
      platforms = return_all_dtab3lets
      platforms.each do |pltfrm|
        a_platforms.push(pltfrm)
      end
      platform_text = []
      # b_platform_other = false
      has_platform_other = false
      platform_other = ""
      publisher_product_platform = publisher_product.publisher_product_platform rescue nil
      if !publisher_product_platform.nil?

          if publisher_product_platform.platform_other_b      
              # b_platform_other = true
              has_platform_other = true
              platform_other = publisher_product_platform.platform_other            
          end    

          if (publisher_product_platform.platform_1 or
              publisher_product_platform.platform_2 or
              publisher_product_platform.platform_3 or
              publisher_product_platform.platform_4 or
              publisher_product_platform.platform_5 or
              publisher_product_platform.platform_6 or
              publisher_product_platform.platform_7 or
              publisher_product_platform.platform_8 or
              publisher_product_platform.platform_9 or
              publisher_product_platform.platform_10 or
              publisher_product_platform.platform_11 or
              publisher_product_platform.platform_12 or
              publisher_product_platform.platform_13)
              
              b = publisher_product_platform.platform_1
              if b
                platform_text.push(a_platforms[0].col_1)                            
              end        
              b = publisher_product_platform.platform_2
              if b
                platform_text.push(a_platforms[1].col_1)                            
              end        
              b = publisher_product_platform.platform_3
              if b
                platform_text.push(a_platforms[2].col_1)                            
              end        
              b = publisher_product_platform.platform_4
              if b
                platform_text.push(a_platforms[3].col_1)  
              end        
              b = publisher_product_platform.platform_5
              if b
                platform_text.push(a_platforms[4].col_1)  
              end        
              b = publisher_product_platform.platform_6
              if b
                platform_text.push(a_platforms[5].col_1)  
              end        
              b = publisher_product_platform.platform_7
              if b
                platform_text.push(a_platforms[6].col_1)  
              end        
              b = publisher_product_platform.platform_8
              if b
                platform_text.push(a_platforms[7].col_1)  
              end        
              b = publisher_product_platform.platform_9
              if b
                platform_text.push(a_platforms[8].col_1)  
              end        
              b = publisher_product_platform.platform_10
              if b
                platform_text.push(a_platforms[9].col_1)  
              end        
              b = publisher_product_platform.platform_11
              if b
                platform_text.push(a_platforms[10].col_1)  
              end        
              b = publisher_product_platform.platform_12
              if b
                platform_text.push(a_platforms[11].col_1)  
              end        
              b = publisher_product_platform.platform_13
              if b
                platform_text.push(a_platforms[12].col_1)  
              end        
          end
      else
          Rails.logger.info("publisher_product_platform was nil")
      end

      h_platform = Hash.new
      h_platform[:platform_text] = platform_text
      # h_platform[:b_platform_other] = b_platform_other
      h_platform[:has_platform_other] = has_platform_other
      h_platform[:platform_other] = platform_other
      
      return h_platform
  end



  def file_type_for(publisher_product)

      a_file_types = Array.new
      file_types = return_all_dtab1lets
      file_types.each do |ft|
        a_file_types.push(ft)
      end
      file_type_text = []    
      has_file_type_other = false
      file_type_other = ""
      publisher_product_file_type = publisher_product.publisher_product_file_type rescue nil
      if !publisher_product_file_type.nil?
          if publisher_product_file_type.file_type_other_b      
              has_file_type_other = true
              file_type_other = publisher_product_file_type.file_type_other            
          end        
          if (publisher_product_file_type.file_type_1 or
              publisher_product_file_type.file_type_2 or
              publisher_product_file_type.file_type_3 or
              publisher_product_file_type.file_type_4 or
              publisher_product_file_type.file_type_5 or
              publisher_product_file_type.file_type_6 or
              publisher_product_file_type.file_type_7 or
              publisher_product_file_type.file_type_8 or
              publisher_product_file_type.file_type_9 or
              publisher_product_file_type.file_type_10 or
              publisher_product_file_type.file_type_11 or
              publisher_product_file_type.file_type_12 or
              publisher_product_file_type.file_type_13 or
              publisher_product_file_type.file_type_14 or
              publisher_product_file_type.file_type_15 or
              publisher_product_file_type.file_type_16 or
              publisher_product_file_type.file_type_17 or
              publisher_product_file_type.file_type_18 or
              publisher_product_file_type.file_type_19 or
              publisher_product_file_type.file_type_20 or
              publisher_product_file_type.file_type_21)
              
              b = publisher_product_file_type.file_type_1
              if b
                file_type_text.push(a_file_types[0].col_1)                            
              end        
              b = publisher_product_file_type.file_type_2
              if b
                file_type_text.push(a_file_types[1].col_1)                            
              end        
              b = publisher_product_file_type.file_type_3
              if b
                file_type_text.push(a_file_types[2].col_1)                            
              end        
              b = publisher_product_file_type.file_type_4
              if b
                file_type_text.push(a_file_types[3].col_1)  
              end        
              b = publisher_product_file_type.file_type_5
              if b
                file_type_text.push(a_file_types[4].col_1)  
              end        
              b = publisher_product_file_type.file_type_6
              if b
                file_type_text.push(a_file_types[5].col_1)  
              end        
              b = publisher_product_file_type.file_type_7
              if b
                file_type_text.push(a_file_types[6].col_1)  
              end        
              b = publisher_product_file_type.file_type_8
              if b
                file_type_text.push(a_file_types[7].col_1)  
              end        
              b = publisher_product_file_type.file_type_9
              if b
                file_type_text.push(a_file_types[8].col_1)  
              end        
              b = publisher_product_file_type.file_type_10
              if b
                file_type_text.push(a_file_types[9].col_1)  
              end        
              b = publisher_product_file_type.file_type_11
              if b
                file_type_text.push(a_file_types[10].col_1)  
              end        
              b = publisher_product_file_type.file_type_12
              if b
                file_type_text.push(a_file_types[11].col_1)  
              end        
              b = publisher_product_file_type.file_type_13
              if b
                file_type_text.push(a_file_types[12].col_1)  
              end        
              b = publisher_product_file_type.file_type_14
              if b
                file_type_text.push(a_file_types[13].col_1)  
              end        
              b = publisher_product_file_type.file_type_15
              if b
                file_type_text.push(a_file_types[14].col_1)  
              end        
              b = publisher_product_file_type.file_type_16
              if b
                file_type_text.push(a_file_types[15].col_1)  
              end        
              b = publisher_product_file_type.file_type_17
              if b
                file_type_text.push(a_file_types[16].col_1)  
              end        
              b = publisher_product_file_type.file_type_18
              if b
                file_type_text.push(a_file_types[17].col_1)  
              end        
              b = publisher_product_file_type.file_type_19
              if b
                file_type_text.push(a_file_types[18].col_1)  
              end        
              b = publisher_product_file_type.file_type_20
              if b
                file_type_text.push(a_file_types[19].col_1)  
              end        
              b = publisher_product_file_type.file_type_21
              if b
                file_type_text.push(a_file_types[20].col_1)  
              end        
          end
      else
          Rails.logger.info("publisher_product_file_type was nil")
      end

      h_file_type = Hash.new
      h_file_type[:file_type_text] = file_type_text
      h_file_type[:has_file_type_other] = has_file_type_other
      h_file_type[:file_type_other] = file_type_other
      
      return h_file_type
  end
  


  def by_review_for(publisher_product)

      a_by_reviews = Array.new
      by_reviews = return_all_dtab7lets
      by_reviews.each do |by_review|
        a_by_reviews.push(by_review)
      end
      by_review_text = []
      # has_by_review_listing = false
      has_by_review_other = false
      by_review_other = ""
      publisher_product_by_review = publisher_product.publisher_product_by_review rescue nil
      if !publisher_product_by_review.nil?
          if publisher_product_by_review.by_review_other_b      
              has_by_review_other = true
              has_by_review_listing = true
              by_review_other = publisher_product_by_review.by_review_other            
          end                
          if (publisher_product_by_review.by_review_1 or
              publisher_product_by_review.by_review_2)
              
              # has_by_review_listing = true          
      
              b = publisher_product_by_review.by_review_1
              if b
                by_review_text.push(a_by_reviews[0].col_1)                            
              end        
              b = publisher_product_by_review.by_review_2
              if b
                by_review_text.push(a_by_reviews[1].col_1)                            
              end        
          end
      else
          Rails.logger.info("publisher_product_by_review was nil")
      end

      h_by_review = Hash.new
      # h_by_review[:has_by_review_listing] = has_by_review_listing
      h_by_review[:by_review_text] = by_review_text
      h_by_review[:has_by_review_other] = has_by_review_other
      h_by_review[:by_review_other] = by_review_other
      
      return h_by_review
  end


  def enhancement_for(publisher_product)

      a_enhancements = Array.new
      enhancements = return_all_dtab6lets
      enhancements.each do |enhncmnt|
        a_enhancements.push(enhncmnt)
      end
      # gon.enhancement = []
      enhancement_text = []    
      # b_enhancement_other = false
      has_enhancement_other = false
      enhancement_other = ""
      publisher_product_enhancement = publisher_product.publisher_product_enhancement rescue nil
      if !publisher_product_enhancement.nil?
          if publisher_product_enhancement.enhancement_other_b      
              # b_enhancement_other = true
              has_enhancement_other = true
              enhancement_other = publisher_product_enhancement.enhancement_other            
          end            
          if (publisher_product_enhancement.enhancement_1 or
              publisher_product_enhancement.enhancement_2 or
              publisher_product_enhancement.enhancement_3 or
              publisher_product_enhancement.enhancement_4 or
              publisher_product_enhancement.enhancement_5 or
              publisher_product_enhancement.enhancement_6 or
              publisher_product_enhancement.enhancement_7 or
              publisher_product_enhancement.enhancement_8 or
              publisher_product_enhancement.enhancement_9 or
              publisher_product_enhancement.enhancement_10 or
              publisher_product_enhancement.enhancement_11 or
              publisher_product_enhancement.enhancement_12)
              
              b = publisher_product_enhancement.enhancement_1
              if b
                enhancement_text.push(a_enhancements[0].col_1)                            
              end        
              b = publisher_product_enhancement.enhancement_2
              if b
                enhancement_text.push(a_enhancements[1].col_1)                            
              end        
              b = publisher_product_enhancement.enhancement_3
              if b
                enhancement_text.push(a_enhancements[2].col_1)                            
              end        
              b = publisher_product_enhancement.enhancement_4
              if b
                enhancement_text.push(a_enhancements[3].col_1)                            
              end        
              b = publisher_product_enhancement.enhancement_5
              if b
                enhancement_text.push(a_enhancements[4].col_1)                            
              end        
              b = publisher_product_enhancement.enhancement_6
              if b
                enhancement_text.push(a_enhancements[5].col_1)                            
              end        
              b = publisher_product_enhancement.enhancement_7
              if b
                enhancement_text.push(a_enhancements[6].col_1)                            
              end        
              b = publisher_product_enhancement.enhancement_8
              if b
                enhancement_text.push(a_enhancements[7].col_1)                            
              end        
              b = publisher_product_enhancement.enhancement_9
              if b
                enhancement_text.push(a_enhancements[8].col_1)                            
              end        
              b = publisher_product_enhancement.enhancement_10
              if b
                enhancement_text.push(a_enhancements[9].col_1)                            
              end        
              b = publisher_product_enhancement.enhancement_11
              if b
                enhancement_text.push(a_enhancements[10].col_1)                            
              end        
              b = publisher_product_enhancement.enhancement_12
              if b
                enhancement_text.push(a_enhancements[11].col_1)                            
              end        
          end
      else
          Rails.logger.info("publisher_product_enhancement was nil")
      end

      h_enhancement = Hash.new
      h_enhancement[:enhancement_text] = enhancement_text
      h_enhancement[:has_enhancement_other] = has_enhancement_other
      h_enhancement[:enhancement_other] = enhancement_other
      
      return h_enhancement
  end










  # def publisher_product_description_for(publisher_product)
    # # publisher_product_descriptions_path = publisher_product.publisher_product_description
    # publisher_product_description = publisher_product.publisher_product_description
# 
    # # return '/Publisher-Product-Description'
    # # publisher_product_description = publisher_product.publisher_product_description
  # end  


  def publisher_product_logo_for(publisher_product)
    # img = UserProfileImage.where("user_id = ?", user.id).first     
    img = PublisherProductLogo.where("publisher_product_id = ?", publisher_product.id).first
    if !img.nil?     
      publisher_product_logo_url = img.image_url(:image_100_100)
    else
      publisher_product_logo_url = "../images_avatar/avatar-gen-corp-w100-h100.png"
    end
      image_tag(publisher_product_logo_url, alt: "", class: "")
  end  


  # <img id="img_image_1" alt="" src="<%= @image_1.image_url(:user_200_200) + '?' + (rand(10..90) * rand(100..900)).to_s if @image_1.image? %>" />

  def publisher_product_pos1_200_for(publisher_product)
      img = publisher_product.publisher_product_pos1_image rescue nil     
      if !img.nil?     
        publisher_product_pos1_200_url = img.image_url(:image_200_200)
      else
        publisher_product_pos1_200_url = "../images_avatar/avatar-gen-product-w200-h200.png"
      end
    
      s_rand = '?' + (rand(10..90) * rand(100..900)).to_s
      image_tag(publisher_product_pos1_200_url + s_rand, alt: "", class: "")
  end  

  def publisher_product_image_for(publisher_product)
    # img = UserProfileImage.where("user_id = ?", user.id).first     
    img = PublisherProductImage.where("publisher_product_id = ?", publisher_product.id).first
    if !img.nil?     
      publisher_product_image_url = img.image_url(:image_100_100)
      # publisher_product_image_url = "../images_publisher_product/image_company_generic_w100_h100_1.png"
      # publisher_product_image_url = "../journal_poster/logo_journalposter_generic_2.jpg"
    else
      publisher_product_image_url = "../images_publisher_product/image_product_generic_w100_h100_3.png"
      # publisher_product_image_url = "../journal_poster/logo_journalposter_generic_2.jpg"

    end
      image_tag(publisher_product_image_url, alt: "", class: "")
  end  


  def sort_direction_asc
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def return_all_dtab1lets      
    return Dtab1let.order(sort_column_dtab1let + " " + sort_direction_asc)
  end
  def sort_column_dtab1let
    Dtab1let.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def return_all_dtab3lets      
    return Dtab3let.order(sort_column_dtab3let + " " + sort_direction_asc)
  end
  def sort_column_dtab3let
    Dtab3let.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def return_all_dtab4lets      
    return Dtab4let.order(sort_column_dtab4let + " " + sort_direction_asc)
  end
  def sort_column_dtab4let
    Dtab4let.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def return_all_dtab6lets      
    return Dtab6let.order(sort_column_dtab6let + " " + sort_direction_asc)
  end
  def sort_column_dtab6let
    Dtab6let.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def return_all_dtab7lets      
    return Dtab7let.order(sort_column_dtab7let + " " + sort_direction_asc)
  end
  def sort_column_dtab7let
    Dtab7let.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def return_all_dtab8lets      
    return Dtab8let.order(sort_column_dtab8let + " " + sort_direction_asc)
  end
  def sort_column_dtab8let
    Dtab8let.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def return_all_dtab9lets      
    return Dtab9let.order(sort_column_dtab9let + " " + sort_direction_asc)
  end
  def sort_column_dtab9let
    Dtab9let.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def return_all_dtab10lets      
    return Dtab10let.order(sort_column_dtab10let + " " + sort_direction_asc)
  end
  def sort_column_dtab10let
    Dtab10let.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def return_all_dtab11lets      
    return Dtab11let.order(sort_column_dtab11let + " " + sort_direction_asc)
  end
  def sort_column_dtab11let
    Dtab11let.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end


end
