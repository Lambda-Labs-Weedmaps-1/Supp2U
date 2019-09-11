class Item < ApplicationRecord
    belongs_to :menu
    # belongs_to :carts
    has_one_attached :image

    validates :item_name, presence: true
    validates :price, presence: true
    validates :image, presence: true
end