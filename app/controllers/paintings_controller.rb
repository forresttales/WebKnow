class PaintingsController < ApplicationController
  
  layout 'painting'
  
  respond_to :html, :js, :json  
  respond_to :js, :only => [:create, :update, :destroy]
  
  def index
    @paintings = Painting.all
  end

  def show
    @painting = Painting.find(params[:id])
  end

  def new
    @painting = Painting.new
  end

  def create
    
    # @comment = Comment.create(comment_params)
    # if request.xhr? || remotipart_submitted?
    # sleep 1 if params[:pause]
    # render :layout => false, :template => (params[:template] == 'escape' ? 'comments/escape_test' : 'comments/create'), :status => (@comment.errors.any? ? :unprocessable_entity : :ok)
    # else
    # redirect_to comments_path
    # end
    
    @painting = Painting.create(params[:painting])

    if request.xhr? || remotipart_submitted?
      # sleep 1 if params[:pause]
      # render :layout => false, :template => (params[:template] == 'escape' ? 'comments/escape_test' : 'comments/create'), :status => (@comment.errors.any? ? :unprocessable_entity : :ok)
    else
      #redirect_to comments_path
    
      render text: 'failed'
    end
    
    # render text: 'create'
    
    # respond_to do |format|
      # format.html {}
      # format.js
      # format.json { render :json => {} } 
    # end
    
    
  end

  def edit
    @painting = Painting.find(params[:id])
  end

  def update
    @painting = Painting.find(params[:id])
    if @painting.update_attributes(params[:painting])
      redirect_to paintings_url, notice: "Painting was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @painting = Painting.find(params[:id])
    @painting.destroy
    redirect_to paintings_url, notice: "Painting was successfully destroyed."
  end

  
end
