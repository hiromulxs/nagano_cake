class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item

#   def sum_price
#   item.taxin_price*quantity
#   end
end
