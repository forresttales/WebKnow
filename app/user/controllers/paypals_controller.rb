class PaypalsController < ApplicationController
  
  layout 'paypal'
  
  def index
  end
  
  def pay
    render text: 'pay with paypal'
    
  end
  
  
end
