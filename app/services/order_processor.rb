class OrderProcessor

    # attr_accessor :order, :items

    def initialize(order)
        @order = order
        @items = order.order_items
    end

    # checks to see if the order can be shipped (if it is a pending order with items in it). If so, it reduces the inventory for
    # each item being shipped, and then updates the order to shipped.
    def ship
        return false unless items_available?

        if @order.ship
            @items.each { |item| item.reduce_inventory }
        end
    
    end

    private

    # Verifies positive inventory of items. (available? is a function in item model). 
    def items_available?
        # available? is a method on orderitems model that checks to make sure the inventory is greater than 1
      @items.all? { |item| item.available? }
    end

end