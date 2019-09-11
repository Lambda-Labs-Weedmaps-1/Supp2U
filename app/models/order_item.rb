class OrderItem < ApplicationRecord
    belongs_to :order
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