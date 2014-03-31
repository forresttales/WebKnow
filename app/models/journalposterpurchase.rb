# == Schema Information
#
# Table name: journalposterpurchases
#
#  id               :integer          not null, primary key
#  id_user          :integer
#  id_journalposter :integer
#  description      :string(255)
#  price            :decimal(5, 2)
#  created_at       :datetime
#  updated_at       :datetime
#

class Journalposterpurchase < ActiveRecord::Base
  


  def total_price
    # convert to array so it doesn't try to do sum on database directly
    # line_items.to_a.sum(&:full_price)
  end
  
  def paypal_url(return_url)
    values = {
      :business => 'seller_1229899173_biz@railscasts.com',
      :cmd => '_cart',
      :upload => 1,
      :return => return_url,
      :invoice => id
    }
    line_items.each_with_index do |item, index|
      values.merge!({
        "amount_#{index+1}" => item.unit_price,
        "item_name_#{index+1}" => item.product.name,
        "item_number_#{index+1}" => item.id,
        "quantity_#{index+1}" => item.quantity
      })
    end
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end  

    
end
