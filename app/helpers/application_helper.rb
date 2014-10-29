module ApplicationHelper


  def full_title(page_title)
  #def title    
    base_title = "KnowStory"
    if page_title.empty?
    #if @title.empty?      
      base_title
    else
      "#{base_title} | #{page_title}"
      #"#{base_title} | #{@title}"      
    end

  end    


end
