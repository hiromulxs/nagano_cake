class OrderItem < ApplicationRecord

  belongs_to :item
  belongs_to :order

  enum making_status: {impossible: 0, in_preparation: 1, in_production: 2, production_completed: 3}

end
