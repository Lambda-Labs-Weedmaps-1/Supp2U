class Item < ApplicationRecord
    belongs_to :menu
    # belongs_to :carts
    has_one_attached :image

    validates :item_name, presence: true
    validates :price, presence: true

    # def available?
    #     inventory > 0
    # end
    
    # def reduce_inventory
    #     update(inventory: inventory - 1)
    # end
end