class PublisherJournalposterProdshotsController < ApplicationController

  layout 'publisher'

  before_filter :force_http

  @@publisher_journalposter_id = nil
  @@publisher_id = nil
  
  
  def new
    
    # render text: params[:publisher_id]
    @@publisher_journalposter_id = params[:publisher_journalposter_id]
    @@publisher_id = params[:publisher_id]
    
    # @publisher_journalposter_prodshot = PublisherJournalposterProdshot.new(:publisher_id => params[:publisher_id], :publisher_journalposter_id => params[:publisher_journalposter_id])
    @publisher_journalposter_prodshot = PublisherJournalposterProdshot.new

  end


  def create
    
    # @publisher_journalposter_prodshot = PublisherJournalposterProdshot.new(params[:painting])
    @publisher_journalposter_prodshot = PublisherJournalposterProdshot.new(publisher_image_params)
    @publisher_journalposter_prodshot.publisher_id = @@publisher_id
    @publisher_journalposter_prodshot.publisher_journalposter_id = @@publisher_journalposter_id
    
    if @publisher_journalposter_prodshot.save
      #flash[:notice] = "Successfully created painting."
      # redirect_to @painting.gallery
    else
      # render :action => 'new'
    end
    
    publisher_journalposter = PublisherJournalposter.find(@@publisher_journalposter_id)
        
    h_update = Hash.new
    # h_update = { :journalposter_prodshot => '', :has_journalposter_prodshot => false }
    # h_update['journalposter_prodshot'] = uploaded_io.original_filename
    # h_update['journalposter_prodshot'] = @publisher_journalposter_prodshot.image_name
    h_update['has_journalposter_prodshot'] = true

    if publisher_journalposter.update_columns( h_update )
      publisher_journalposter = nil          
      # if publisher_journalposter_prodshot.save
          # # session[:publisher_image_upload_status] = true
          # # redirect_to '/PublisherJournalPosterDescription?id=' + @@publisher_journalposter_id.to_s
      redirect_to :controller => 'publisher_journalposter_descriptions', :action => 'index', :id => @@publisher_journalposter_id
      # else
          # # session[:publisher_journalposter_prodshot_upload_status] = false
          # render 'create'        
      # end    
    else
      render text: 'Upadate Publisher Product with has_journalposter_prodshot failed'      
    end    
    
  end


  def edit
    render text: 'edit publisher_journalposter_prodshot'
    
    
    # @painting = Painting.find(params[:id])
  end


  def update
    
    render text: 'update publisher_journalposter_prodshot'
    
    # @painting = Painting.find(params[:id])
    # if @painting.update_attributes(params[:painting])
      # flash[:notice] = "Successfully updated painting."
      # redirect_to @painting.gallery
    # else
      # render :action => 'edit'
    # end
  end


  def destroy
    
    # render text: session[:publisher_journalposter_id]
    
    @publisher_journalposter_prodshot = PublisherJournalposterProdshot.find(params[:id])
    @publisher_journalposter_prodshot.destroy
    
    
    h_update = Hash.new
    h_update['has_journalposter_prodshot'] = false

    publisher_journalposter = PublisherJournalposter.find(session[:publisher_journalposter_id])

    if publisher_journalposter.update_columns( h_update )
      publisher_journalposter = nil          
      redirect_to :controller => 'publisher_journalposter_descriptions', :action => 'index', :id => session[:publisher_journalposter_id]    
    else
      render text: 'destroy publisher_journalposter_prodshot operation failed'
    end    
    
    # flash[:notice] = "Successfully destroyed painting."
    # redirect_to @painting.gallery
  end
  


  private

    def publisher_image_params
      params.require(:publisher_journalposter_prodshot).permit(      
                                              :publisher_id,
                                              :publisher_journalposter_id, 
                                              :image 
                                              )
                                        
    end

  
  


end
