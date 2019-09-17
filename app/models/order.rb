class Order < ApplicationRecord
    belongs_to :customer
    belongs_to :business
    belongs_to :cart
    has_many :order_items

    validates :customer_id, presence: true
    validates :business_id, presence: true
    validates :cart_id, presence: true
    validates :status, presence: true
    validates :order_items, presence: true, unless: :cart_items_present?


    # makes sure the order passes shipping requirements
    def shippable?
        status != "shipped" && order_items.count >= 1
    end
    
    # once the order is confirmed to be shippable, it ships.
    def ship
        shippable? && update(status: "shipped")
    end

    def cart_items_present?
        
        self.cart.item_numbers.length > 0
    end

end

