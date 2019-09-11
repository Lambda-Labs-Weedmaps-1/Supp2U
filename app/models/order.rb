class Order < ApplicationRecord
    has_many :order_items
    belongs_to :customer
    belongs_to :business

    validates :customer_id, presence: true
    validates :business_id, presence: true
    validates :status, presence: true
    # validates :items, presence: true

    # makes sure the order passes shipping requirements
    def shippable?
        status != "shipped" && items.count >= 1
    end
    
    # once the order is confirmed to be shippable, it ships.
    def ship
        shippable? && update(status: "shipped")
    end

end