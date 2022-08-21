class Item < ApplicationRecord
  belongs_to :genre

  has_one_attached :image

  def get_image
    if image.attached?
      image
    else
      "no_image.jpg"
    end
  end
end
