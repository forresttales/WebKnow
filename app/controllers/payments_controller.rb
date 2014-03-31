class PaymentsController < ApplicationController

  layout 'authorize_net'
  helper :authorize_net
  protect_from_forgery :except => :relay_response

  # before_filter :force_ssl
  # force_ssl
  # force_ssl if: :ssl_configured?


  def ssl_configured?
    !Rails.env.development?
  end
  
  # GET
  # Displays a payment form.
  def payment
    @amount = 2.00
    @sim_transaction = AuthorizeNet::SIM::Transaction.new(AUTHORIZE_NET_CONFIG['api_login_id'], AUTHORIZE_NET_CONFIG['api_transaction_key'], @amount, :relay_url => payments_relay_response_url(:only_path => false))
  end

  # POST
  # Returns relay response when Authorize.Net POSTs to us.
  def relay_response
    sim_response = AuthorizeNet::SIM::Response.new(params)
    if sim_response.success?(AUTHORIZE_NET_CONFIG['api_login_id'], AUTHORIZE_NET_CONFIG['merchant_hash_value'])
      render :text => sim_response.direct_post_reply(payments_receipt_url(:only_path => false), :include => true)
    else
      render
    end
  end
  
  # GET
  # Displays a receipt.
  def receipt
    @auth_code = params[:x_auth_code]
  end

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

