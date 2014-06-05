class JournalpostersController < ApplicationController
  
  layout 'journalposter'
  
  def index
    
    # session[:username].nil?
    gon.profile = ''
    if !session[:profile].nil?
      if session[:profile] == "/Publishers"
        gon.profile = "publisher"
      end
    # else
      # render text: 'nil'
    end
    
    id_map = 1
    b = false
    log_available_posters = LogAvailablePoster.where("id_map = ?", id_map)
    if log_available_posters.any?
      log_available_poster = log_available_posters[0]
      b = log_available_poster.closed  
    end        

    if b
      render text: "poster 1 is no longer available"
    else
      #
    end    
    
  end


  def new
  end


  def create
  end


  def show
  end


end
