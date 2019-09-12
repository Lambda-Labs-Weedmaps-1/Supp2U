class OrderProcessor

    # attr_accessor :order, :items

    def initialize(order)
        @order = order
        @items = order.order_items
    end

    # checks to see if the items in the order are shippable. If so, it reduces the inventory for
    # each item being shipped, and then updates the order to shipped.
    def ship
        return false unless items_available?

        @items.each { |item| item.reduce_inventory }
        @order.ship
    end

    private

    # Checks to see if the inventory for each item is > 0 (available? is a function in item model). 
    def items_available?
      @items.all? { |item| item.available? }
    end

end