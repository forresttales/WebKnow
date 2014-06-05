class ImageSizesController < ApplicationController

  layout 'publisher'

  before_filter :force_http


  def new
    @image_size = ImageSize.new
  end


  def create

    @image_size = ImageSize.new(image_size_params)
    
    # session[:image_name_file] = params[:image_size][:name]    
    
    # render text: session[:image_name_file]
    
    if @image_size.save
      redirect_to :action => 'new'
    else
      render text: 'image_size save failed'
    end
    
  end


  def dbdelete

      ImageSize.dbdelete
      ImageSize.dbclear

  end


  def edit
  end


  def update
  end


  def destroy
  end


  private

    def image_size_params
      params.require(:image_size).permit(      
                                         :name,
                                         :image 
                                        )
    end


end
