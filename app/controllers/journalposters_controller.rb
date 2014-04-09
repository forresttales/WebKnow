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
    
  end


  def new
  end


  def create
  end


  def show
  end


end
