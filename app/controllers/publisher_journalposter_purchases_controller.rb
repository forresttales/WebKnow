class PublisherJournalposterPurchasesController < ApplicationController
  
  layout 'publisher'
  
  helper :authorize_net
  protect_from_forgery :except => :relay_response
  # force_ssl :only => [:new, :relay_response, :receipt]
  
  @@publisher_journalposter_id = nil
  @@poster = nil

  def index
    
    @@publisher_journalposter_id = params[:id]

    @publisher_journalposter_purchases = PublisherJournalposterPurchase.where("publisher_journalposter_id = ?", params[:id])
    

    if @publisher_journalposter_purchases.any?
      redirect_to :action => 'show', :publisher_journalposter_id => params[:id]
    else
      redirect_to :action => 'new', :publisher_journalposter_id => params[:id]
    end
    
  end


  def verify_complete(id)
    
    @publisher_journalposter = PublisherJournalposter.find(id)
    
    msg = ""
    warnings = false
    if !@publisher_journalposter.has_journalposter_logo
      msg += "You have not uploaded a company logo image. A logo is optional, though strongly recommended."
      warnings = true
    end

    if warnings == false
      msg = "We have checked to make sure that your Journal Poster options are complete. Your Journal Poster is ready."
    end

    return msg    
    
  end


  def new

    @@publisher_journalposter_id = params[:publisher_journalposter_purchase][:id]
    @@poster = params[:publisher_journalposter_purchase][:poster]

    publisher_journalposter = PublisherJournalposter.find(@@publisher_journalposter_id)
    @poster_text = publisher_journalposter.poster_text
    publisher_journalposter = nil
    
    # @publisher_journalposter_purchase = PublisherJournalposterPurchase.new
    # @@publisher_journalposter_id = params[:publisher_journalposter_purchase][:publisher_journalposter_id]
    
    @amount = 0.00
    case @@poster.to_s
      when "1"
        @amount = 1.00
      when "2"
        @amount = 2.00
      when "3"
        @amount = 3.00
      when "4"
        @amount = 4.00
      else
        @amount = 0.00
    end

    @msg = verify_complete(@@publisher_journalposter_id)

    @sim_transaction = AuthorizeNet::SIM::Transaction.new(AUTHORIZE_NET_CONFIG['api_login_id'], AUTHORIZE_NET_CONFIG['api_transaction_key'], @amount, :relay_url => publisher_journalposter_purchases_relay_response_url(:only_path => false))
    
  end


  def create
  end


  def show
    render text: 'purchase show'        
  end


  def edit
  end


  def update  
    render text: 'update journalposterpurchases'  
  end
  
  
  def ssl_configured?
    !Rails.env.development?
  end
  
  # GET
  # Displays a payment form.
  # def payment
    # @amount = 2.00
    # @sim_transaction = AuthorizeNet::SIM::Transaction.new(AUTHORIZE_NET_CONFIG['api_login_id'], AUTHORIZE_NET_CONFIG['api_transaction_key'], @amount, :relay_url => payments_relay_response_url(:only_path => false))
  # end

  # POST
  # Returns relay response when Authorize.Net POSTs to us.
  def relay_response
    
    sim_response = AuthorizeNet::SIM::Response.new(params)    
    if sim_response.success?(AUTHORIZE_NET_CONFIG['api_login_id'], AUTHORIZE_NET_CONFIG['merchant_hash_value'])
    
        publisher_journalposter = PublisherJournalposter.find(@@publisher_journalposter_id)

        h_new = Hash.new
        h_new[:publisher_journalposter_id] = @@publisher_journalposter_id        
        h_new[:publisher_id] = publisher_journalposter.publisher_id        
    
        case @@poster.to_s
          when "1"
            h_new[:price] = 1
            h_new[:price_paid] = 1
          when "2"
            h_new[:price] = 2
            h_new[:price_paid] = 2
          when "3"
            h_new[:price] = 3
            h_new[:price_paid] = 3
          when "4"
            h_new[:price] = 4
            h_new[:price_paid] = 4
          else
            h_new[:price] = 0
        end

        publisher_journalposter_purchase = PublisherJournalposterPurchase.new(h_new)
        
        h_update = Hash.new
        h_update[:has_purchase] = true
    
        if publisher_journalposter_purchase.save
            h_update[:purchase_date] = publisher_journalposter_purchase.created_at
            if publisher_journalposter.update_attributes(h_update)
              #
            else
              render text: 'publisher_journalposter.update_attributes failed'
            end          
        else
          render text: 'publisher_journalposter_purchase save failed'
        end

        render :text => sim_response.direct_post_reply(publisher_journalposter_purchases_receipt_url(:only_path => false), :include => true)
    else
      render
    end
    
    
  end
  
  # GET
  # Displays a receipt.
  def receipt
    @auth_code = params[:x_auth_code]
  end
  
  
  
  private

    def jp_params
      params.require(:publisher_journalposter_purchase).permit(
                                                    :id_user,
                                                    :publisher_id,
                                                    :publisher_journalposter_id,
                                                    :message,
                                                    :price,
                                                    :price_owed,
                                                    :price_paid,
                                                    :price_refund,
                                                    :created_at,
                                                    :updated_at                                                    
                                                   )
    end


  
end




      # <%= form_for( @publisher_journalposter_purchase, :html => {:id => "form_transact"}) do |f| %> 
      # <%= f.submit 'Purchase', class: 'sign-btn-cc' %>
      # <% end %>




