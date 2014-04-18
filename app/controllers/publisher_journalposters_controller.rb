class PublisherJournalpostersController < ApplicationController
  
  layout 'publisher'

  require 'csv'
  
  helper_method :sort_column, :sort_direction

  
  def index
    
    @publisher_journalposters = PublisherJournalposter.where("publisher_id = ?", session[:publisher_id]).order(sort_column + " " + sort_direction).paginate(:per_page => 200, :page => params[:page])
    
  end
  
  def new
    
    if !(session[:username].nil? or session[:publisher_id].nil?)
      # @username = session[:username]
      @publisher_journalposter = PublisherJournalposter.new
    else
      render text: 'failed sessions'
    end
    
  end

  
  def create
    publisher_journalposter = PublisherJournalposter.new(publisher_journalposter_params)
    # publisher_journalposter.publisher_id = session[:publisher_id]
    # user = User.find(session[:user_id])

    session[:poster] = publisher_journalposter.poster

    redirect_to(:controller => 'publisher_journalposter_descriptions', :action => 'new')
    
    # #if user.update_columns( :has_account => true, :account_type => "publisher")      
      # if publisher_journalposter.save
#         
        # # session[:has_account] = true
#         
        # # redirect_to(:action => 'index')
      # else
        # render text: 'save journalposter failed'
        # #render("new")
      # end
    # #else
    # #  render text: 'update user_id failed'
    # #end
    
  end


  def edit
    #@publisher_journalposter_description = PublisherJournalposterDescription.find_by_id(params[:id])    
    
    @publisher_journalposter = PublisherJournalposter.find_by_id(params[:id])
    #@@publisher_journalposter_description_id = params[:publisher_journalposter][:poster]
    #@publisher_journalposter_name = publisher_journalposter.name_journalposter
    # @publisher_journalposter_has_description = publisher_journalposter.has_description
    #@publisher_journalposter_id = @@publisher_journalposter_id
    
    #@type_content = ""
    
  end
  
  def update
    
    session[:poster] = params[:publisher_journalposter][:poster]

    #render text: params[:publisher_journalposter][:id]

    redirect_to(:controller => 'publisher_journalposter_descriptions', :action => 'edit', :id => params[:id])
    
    # publisher_journalposter_description = PublisherJournalposterDescription.find(params[:id])
    # publisher_journalposter_description_temp = PublisherJournalposterDescription.new(publisher_journalposter_description_params)
    # poster = publisher_journalposter_description_temp.poster
    # #subject_category_index = publisher_journalposter_description_temp.subject_category_index
    # publisher_journalposter_description_temp = nil
#     
    # #jp = publisher_journalposter_description
    # poster_text = ""
    # case poster  
      # when 1
        # poster_text = "Free Online Poster Pin"
      # when 2
        # poster_text = "Print Poster Pin and Online Listing"
      # when 3
        # poster_text = "Poster Pin, Custom Ad Box, Online Listing"
      # when 4
        # poster_text = "Poster Back Cover, Poster Pin, Online Listing"
      # else
        # #
    # end
#     
    # #publisher_journalposter_description = jp
#     
    # # s_subject_category = s
    # h_update = Hash.new
    # h_update = params[:publisher_journalposter_description]
    # h_update['poster_text'] = poster_text
    # # h_update['subject_category'] = s_subject_category
# 
    # if publisher_journalposter_description.update_attributes(h_update)
    # # if publisher_journalposter_description.update_attributes(publisher_journalposter_description_params)
        # redirect_to '/PublisherJournalPosterDescription?id=' + @@publisher_journalposter_id.to_s
    # else
      # render text: 'update failed'
    # end    
    
    
  end










  def dbdelete

      PublisherJournalposter.dbdelete
      PublisherJournalposter.dbclear
      
      PublisherJournalposterDescription.connection.execute("DELETE FROM publisher_journalposter_descriptions")      
      PublisherJournalposterDescription.connection.execute("ALTER SEQUENCE publisher_journalposter_descriptions_id_seq RESTART WITH 1")
      
      respond_to do |format|
        format.js { redirect_to(:action => 'index', :form => :js ) }
        format.html
      end
      
  end


  def delete
    # @contact = Contact.find(params[:id])
  end


  def destroy

    publisher_journalposter = PublisherJournalposter.find(params[:id])
    
    # render text: publisher_journalposter.publisher_id.to_s
    
    publisher_journalposter_descriptions = PublisherJournalposterDescription.where("publisher_journalposter_id = ?", publisher_journalposter.id)
    
    # store = Store.find(params[:id])
    if publisher_journalposter.delete

      if publisher_journalposter_descriptions[0].delete
        # @@delete = true
        redirect_to '/PublisherJournalposters'
      else 
        render text: 'Publisher Product Description Delete failed'
      end
      
    else
      render text: 'Publisher Product Delete failed'
    end
     
  end


  # def dbdelete
      # Store.dbdelete
      # redirect_to action: "index"
      # # render text: 'dbdelete'
  # end
  
  # def dbclear
      # Store.dbclear
      # redirect_to action: "index"
      # # render text: 'dbclear'
  # end
  
  # def export
     
    # @stores = @@stores
   
    # respond_to do |format|
      # format.html
      # format.csv
       # #format.js
    # end
     
  # end


  private

    def publisher_journalposter_params
      params.require(:publisher_journalposter).permit(      
                                                :publisher_id, 
                                                :name_journalposter,
                                                :journalposter_logo,
                                                :has_journalposter_logo,
                                                :journalposter_metadata,
                                                :has_journalposter_metadata,
                                                :has_purchase,
                                                :poster,
                                                :poster_text                                                
                                              )
                                        
    end

    def sort_column
      PublisherJournalposter.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
  
end
