class OrderItem < ApplicationRecord
    belongs_to :order
    belongs_to :item
    has_one_attached :image

    validates :item_name, presence: true
    validates :price, presence: true


    def available?
        puts "hereeeeeeee #{self.item.inspect}"
        self.item.inventory > 0
    end

    def reduce_inventory
        current_inventory = self.item.inventory
        # puts "confusedddd #{self.item.update(inventory: 2)}"
        self.item.update(inventory: current_inventory - 1)
    end
end