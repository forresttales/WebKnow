class PaymentsController < ApplicationController

  layout 'authorize_net'
  helper :authorize_net
  protect_from_forgery :except => :relay_response
  
  respond_to :html, :js, :json  
  

  # before_filter :force_ssl
  # force_ssl
  # force_ssl if: :ssl_configured?

  @@amount = 0
  # @@a_prod_1 = 0
  @@a_prod = nil
  
  @@publisher_id = nil
  @@ad_index = nil
  @@ad_description = nil
  @@ad_amount = nil
  
  @@a_prod_length = nil
  

  def ssl_configured?
    !Rails.env.development?
  end
  
  # GET
  # Displays a payment form.
  def purchase
    @amount = 1.00
    # @amount = @@amount
    
    
    # @a_prod_1 = @@a_prod_1

    # @publisher_id = @@publisher_id
    
    # @a_prod_length = @@a_prod_length

    gon.a_prod = @@a_prod
    
    @sim_transaction = AuthorizeNet::SIM::Transaction.new(AUTHORIZE_NET_CONFIG['api_login_id'], AUTHORIZE_NET_CONFIG['api_transaction_key'], @amount, :relay_url => payments_relay_response_url(:only_path => false))
    
  end

  # POST
  def payment
    # @amount = params[:amount]
    # @amount = 2.00
    
    ar = params[:payment]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end
    
    # amount = h_obj[:amount]
    # publisher_id = h_obj[:publisher_id]
    # a_prod = h_obj[:a_prod]
    # @@a_prod_len = 123
    # @@a_prod = a_prod    
    # @@amount = amount
    # @@publisher_id = publisher_id

    # ad_index = h_obj[:ad_index]
    # ad_description = h_obj[:ad_description]
    # ad_amount = h_obj[:ad_amount]
        
    # @@ad_index = ad_index
    # @@ad_description = ad_description
    # @@ad_amount = amount
    # @@ad_status_purchased = nil
    # @@ad_status_public = nil
    # @@ad_date_exp = nil
    # @@ad_date_init = nil
        
        
    # @sim_transaction = AuthorizeNet::SIM::Transaction.new(AUTHORIZE_NET_CONFIG['api_login_id'], AUTHORIZE_NET_CONFIG['api_transaction_key'], @amount, :relay_url => payments_relay_response_url(:only_path => false))
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :amount => amount } }

      # format.json { render :json => {} }

    end
    
  end


  def payment_product_posters
    # @amount = params[:amount]
    # @amount = 2.00
    
    ar = params[:payment]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end
    
    amount = h_obj[:amount]
    @@amount = amount

    publisher_id = h_obj[:publisher_id]
    @@publisher_id = publisher_id

    a_prod = h_obj[:a_prod]
    @@a_prod = a_prod
    @@a_prod_length = a_prod.length
    # @@a_prod = a_prod
    

        
    # @sim_transaction = AuthorizeNet::SIM::Transaction.new(AUTHORIZE_NET_CONFIG['api_login_id'], AUTHORIZE_NET_CONFIG['api_transaction_key'], @amount, :relay_url => payments_relay_response_url(:only_path => false))
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :amount => amount } }

      # format.json { render :json => {} }

    end
    
  end


  # POST
  # Returns relay response when Authorize.Net POSTs to us.
  def relay_response
    # sim_response = AuthorizeNet::SIM::Response.new(params)
    # if sim_response.success?(AUTHORIZE_NET_CONFIG['api_login_id'], AUTHORIZE_NET_CONFIG['merchant_hash_value'])
      # render :text => sim_response.direct_post_reply(payments_receipt_url(:only_path => false), :include => true)
    # else
      # render
    # end
    
    # payments_receipt_url(:only_path => false)    
    
    redirect_to :action => "receipt"
    
  end
  
  # GET
  # Displays a receipt.
  def receipt
    # @auth_code = params[:x_auth_code]
    # auth_code = @auth_code
    
    publisher = Publisher.where(["user_id = ?", current_user.id]).first
    publisher = current_user.publisher

    a_prod = @@a_prod    
        
    a_prod.each do |a|
        n_ad_type = a[0].join
        s_ad_type = n_ad_type.to_s    
        name_product = a[1].join
        ad_amount = a[6].join
        publisher_product_id = a[7].join

        if(s_ad_type == "1")
            ad_index = 1
            ad_description = "Listing"            
            h_new_1 = Hash.new
            h_new_1[:publisher_id] = publisher.id
            h_new_1[:publisher_product_id] = publisher_product_id
            h_new_1[:name_product] = name_product
            h_new_1[:ad_amount] = ad_amount
            publisher_ad_listing = PublisherAdListing.new(h_new_1)
            if publisher_ad_listing.save
              #
            else
              #
            end        
            h_new_1 = nil  
            publisher_ad_listing = nil                        
        elsif(s_ad_type == "2")
            ad_index = 2
            ad_description = "Square"
            h_new_2 = Hash.new
            h_new_2[:publisher_id] = publisher.id
            h_new_2[:publisher_product_id] = publisher_product_id
            h_new_2[:name_product] = name_product
            h_new_2[:ad_amount] = ad_amount
            publisher_ad_square = PublisherAdSquare.new(h_new_2)
            if publisher_ad_square.save
              #
            else
              #
            end        
            h_new_2 = nil  
            publisher_ad_square = nil

        elsif(s_ad_type == "4")
            ad_index = 4
            ad_description = "Pin"
            h_new_4 = Hash.new
            h_new_4[:publisher_id] = publisher.id
            h_new_4[:publisher_product_id] = publisher_product_id
            h_new_4[:name_product] = name_product
            h_new_4[:ad_amount] = ad_amount
            publisher_ad_pin = PublisherAdPin.new(h_new_4)
            if publisher_ad_pin.save
              #
            else
              #
            end        
            h_new_4 = nil  
            publisher_ad_pin = nil                                                      
        end
          
        h_new = Hash.new
        h_new[:publisher_id] = publisher.id
        # h_new[:auth_code] = auth_code
        h_new[:ad_index] = ad_index
        h_new[:ad_description] = ad_description
        h_new[:publisher_product_id] = publisher_product_id
        # h_new[:ad_status_public_msg] = "s is " + s 
        publisher_ad = PublisherAd.new(h_new)
        if publisher_ad.save
          #
        else
          #
        end        
        h_new = nil  
        # Rails.logger.info("a[1] = " + a[1].to_s)
        # Rails.logger.info("i = " + i.to_s)
    end

    
    
    
  end # end - receipt


end



# require 'rubygems'
# require 'authorize_net'
# API_LOGIN = 'YOUR_API_LOGIN'
# API_KEY = 'YOUR_TRANSACTION_KEY'
# 
# # Get Settled Batch List
# transaction = AuthorizeNet::Reporting::Transaction.new(API_LOGIN,
  # API_KEY, :gateway => :sandbox)
# response = transaction.get_settled_batch_list
# batches = response.batch_list
# puts batches.length.to_s + ' batches in list'
# 
# # Get Details for a Transaction
# transaction = AuthorizeNet::AIM::Transaction.new(API_LOGIN,
  # API_KEY, :gateway => :sandbox)
# credit_card = AuthorizeNet::CreditCard.new('4111111111111111', '1120')
# response = transaction.purchase('10.00', credit_card)
# 
# if response.success?
  # puts "Successfully made a purchase"
  # puts "(authorization code:#{response.authorization_code})"
  # transaction = AuthorizeNet::Reporting::Transaction.new(API_LOGIN,
    # API_KEY, :gateway => :sandbox)
  # response = transaction.get_transaction_details(response.transaction_id)
  # transaction = response.transaction
  # puts "Transaction status: #{transaction.status}"
# else
  # raise 'Failed to make purchase.'
# end

