class PublisherProfilesController < ApplicationController
  
  respond_to :html, :js, :json  
  
  layout 'publisher'

  # before_filter :force_http

        
  def index

    @user_id = current_user.id
    @publisher = Publisher.where("user_id = ?", current_user.id ).first    
    @publisher_id = @publisher.id

    @b_name = true
    @b_url = true
    @b_company_contact_email = true
    @b_company_contact_phone = true    
    @b_company_contact_name_first = true
    @b_company_contact_name_last = true
    @b_address = true
    @b_city = true
    @b_state = true
    @b_zip = true
    @b_country = true
    @b_description = true


    if (@publisher.name.blank?) or (@publisher.name.empty?) or (@publisher.name.nil?)
      @b_name = false
    end
    if (@publisher.url.blank?) or (@publisher.url.empty?) or (@publisher.url.nil?)
      @b_url = false
    end
    if (@publisher.company_contact_email.blank?) or (@publisher.company_contact_email.empty?) or (@publisher.company_contact_email.nil?)
      @b_company_contact_email = false
    end
    if (@publisher.company_contact_phone.blank?) or (@publisher.company_contact_phone.empty?) or (@publisher.company_contact_phone.nil?)
      @b_company_contact_phone = false
    end
    if (@publisher.company_contact_name_first.blank?) or (@publisher.company_contact_name_first.empty?) or (@publisher.company_contact_name_first.nil?)
      @b_company_contact_name_first = false
    end
    if (@publisher.company_contact_name_last.blank?) or (@publisher.company_contact_name_last.empty?) or (@publisher.company_contact_name_last.nil?)
      @b_company_contact_name_last = false
    end
    if (@publisher.address.blank?) or (@publisher.address.empty?) or (@publisher.address.nil?)
      @b_address = false
    end
    if (@publisher.city.blank?) or (@publisher.city.empty?) or (@publisher.city.nil?)
      @b_city = false
    end
    if ((@publisher.state.blank?) or (@publisher.state.empty?) or (@publisher.state.nil?) or (@publisher.state == '0' ))
      @b_state = false
    end
    if (@publisher.zip.blank?) or (@publisher.zip.empty?) or (@publisher.zip.nil?)
      @b_zip = false
    end
    if (@publisher.country.blank?) or (@publisher.country.empty?) or (@publisher.country.nil?)
      @b_country = false
    end
    if (@publisher.description.blank?) or (@publisher.description.empty?) or (@publisher.description.nil?)
      @b_description = false
    end
    
    @address_states = AddressState.order("state_value ASC").all
    
    gon.publisher_state = @publisher.state

    
  end
  
  def edit

    # Rails.logger.info "clyde was here in edit"
    # Rails.logger.flush    

    @user = User.find(session[:user_id])
    
  end

  # :name, 
  # :address, 
  # :city, 
  # :state, 
  # :country, 
  # :zip,
  # :phone, 
  # :url, 
  # :description, 
  # :company_contact_name_first, 
  # :company_contact_name_last,
  # :company_contact_phone, 
  # :company_contact_email 

  def update_name

    ar = params[:publisher]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_id = h_obj[:publisher_id]
    publisher = Publisher.find(publisher_id)    
    
    # @info1 = Rails.logger.info "clyde in update_name_first"
    # @info2 = Rails.logger.info h_obj

    h_update = Hash.new
    h_update[:name] = h_obj[:name]

    if publisher.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher = nil
    publisher_updated = Publisher.find(publisher_id)
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :name => publisher_updated.name } }
      # format.json { render :partial => "publisher_profiles/test" }
      # format.json { render :json => { :url => '/PublisherProfiles' } }
      # format.json { render :json => @journal1poster_position }
    end
    
  end  

  def update_address
    
  # :address, 
  # :city, 
  # :state, 
  # :country, 
  # :zip,

    ar = params[:publisher]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_id = h_obj[:publisher_id]
    publisher = Publisher.find(publisher_id)    
    
    # @info1 = Rails.logger.info "clyde in update_name_first"
    # @info2 = Rails.logger.info h_obj

    h_update = Hash.new
    h_update[:address] = h_obj[:address]
    h_update[:city] = h_obj[:city]
    h_update[:state] = h_obj[:state]
    h_update[:zip] = h_obj[:zip]
    h_update[:country] = h_obj[:country]

    if publisher.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher = nil
    publisher_updated = Publisher.find(publisher_id)
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :address => publisher_updated.address, :city => publisher_updated.city, :state => publisher_updated.state, :zip => publisher_updated.zip, :country => publisher_updated.country } }
      # format.json { render :partial => "publisher_profiles/test" }
      # format.json { render :json => { :url => '/PublisherProfiles' } }
      # format.json { render :json => @journal1poster_position }
    end

    
  end


  def update_country

    ar = params[:publisher]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_id = h_obj[:publisher_id]
    publisher = Publisher.find(publisher_id)    
    
    # @info1 = Rails.logger.info "clyde in update_country_first"
    # @info2 = Rails.logger.info h_obj

    h_update = Hash.new
    h_update[:country] = h_obj[:country]

    if publisher.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher = nil
    publisher_updated = Publisher.find(publisher_id)
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :country => publisher_updated.country } }
      # format.json { render :partial => "publisher_profiles/test" }
      # format.json { render :json => { :url => '/PublisherProfiles' } }
      # format.json { render :json => @journal1poster_position }
    end
    
  end  


  def update_phone
  # :phone 
  end
  
  def update_url
  # :url
  
    ar = params[:publisher]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_id = h_obj[:publisher_id]
    publisher = Publisher.find(publisher_id)    
    
    # @info1 = Rails.logger.info "clyde in update_name_first"
    # @info2 = Rails.logger.info h_obj

    h_update = Hash.new
    h_update[:url] = h_obj[:url]

    if publisher.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher = nil
    publisher_updated = Publisher.find(publisher_id)
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :url => publisher_updated.url } }
      # format.json { render :partial => "publisher_profiles/test" }
      # format.json { render :json => { :url => '/PublisherProfiles' } }
      # format.json { render :json => @journal1poster_position }
    end
  
  end

  def update_description
  # :description
  
    ar = params[:publisher]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_id = h_obj[:publisher_id]
    publisher = Publisher.find(publisher_id)    
    
    # @info1 = Rails.logger.info "clyde in update_name_first"
    # @info2 = Rails.logger.info h_obj

    h_update = Hash.new
    h_update[:description] = h_obj[:description]

    if publisher.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher = nil
    publisher_updated = Publisher.find(publisher_id)
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :description => publisher_updated.description } }
      # format.json { render :partial => "publisher_profiles/test" }
      # format.json { render :json => { :url => '/PublisherProfiles' } }
      # format.json { render :json => @journal1poster_position }
    end
  
  end

  def update_company_contact_name
  # :company_contact_name_first, 
  # :company_contact_name_last,
  
    ar = params[:publisher]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_id = h_obj[:publisher_id]
    publisher = Publisher.find(publisher_id)    
    
    # @info1 = Rails.logger.info "clyde in update_name_first"
    # @info2 = Rails.logger.info h_obj

    h_update = Hash.new
    h_update[:company_contact_name_first] = h_obj[:company_contact_name_first]
    h_update[:company_contact_name_last] = h_obj[:company_contact_name_last]

    if publisher.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher = nil
    publisher_updated = Publisher.find(publisher_id)
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :company_contact_name_first => publisher_updated.company_contact_name_first, :company_contact_name_last => publisher_updated.company_contact_name_last } }
      # format.json { render :json => {} }
    end
  
  end

  def update_company_contact_phone
  # :company_contact_phone 
  
    ar = params[:publisher]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_id = h_obj[:publisher_id]
    publisher = Publisher.find(publisher_id)    
    
    # @info1 = Rails.logger.info "clyde in update_name_first"
    # @info2 = Rails.logger.info h_obj

    h_update = Hash.new
    h_update[:company_contact_phone] = h_obj[:company_contact_phone]

    if publisher.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher = nil
    publisher_updated = Publisher.find(publisher_id)
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :company_contact_phone => publisher_updated.company_contact_phone } }
      # format.json { render :json => {} }
    end
  
  end

  def update_company_contact_email

    # :company_contact_email 

    ar = params[:publisher]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end

    publisher_id = h_obj[:publisher_id]
    publisher = Publisher.find(publisher_id)    
    
    # @info1 = Rails.logger.info "clyde in update_name_first"
    # @info2 = Rails.logger.info h_obj

    h_update = Hash.new
    h_update[:company_contact_email] = h_obj[:company_contact_email]

    if publisher.update_attributes(h_update)
      #
    else
      # Rails.logger.info(@user.errors.messages.inspect)
    end

    publisher = nil
    publisher_updated = Publisher.find(publisher_id)
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :company_contact_email => publisher_updated.company_contact_email } }
      # format.json { render :json => {} }
    end

    
  end  









  private

    def publisher__profiles_params
      params.require(:publisher_profiles).permit(      
                                                :publisher_id, 
                                                :name_logo,
                                                :has_logo
                                              )
                                        
    end

  
  
  
end
