class Item < ApplicationRecord

  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy

  has_one_attached :image

  def get_image
    if image.attached?
      image
    else
      "no_image.jpg"
    end
  end
end
