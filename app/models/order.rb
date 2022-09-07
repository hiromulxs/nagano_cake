class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_items, dependent: :destroy


  enum pay_type: {credit_card: 0, transfer:1}

end
