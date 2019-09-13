require 'rails_helper'

RSpec.describe Order, type: :model do
    describe 'associations' do
        it { should belong_to(:customer).class_name('Customer') }
        it { should belong_to(:business).class_name('Business') }
        it { should belong_to(:cart).class_name('Cart')}
    end

    describe 'order creation' do
        user = User.create!(username: "bob", email: "thebuilder@work.com", password: "widget")
        cust = Customer.create!(user_id: 1, custname: 'Athos')
        bus = Business.create!(user_id: 1,
            name: "Angelo's Taverna",
            website: 'angelosdenver.com',
            city: 'Denver',
            state: 'CO',
            street: '620 E 6th Ave',
            zipcode: 80_203,
            theme: 'American',
            description: "Angelo's Yo !",
            lat: '39.725465',
            long: '-104.979174')

        carto = Cart.create!(customer_id: 1, business_id: 1)

        Menu.create!(
            {
                "business_id": 1,
                "name": "Gourmet Stuff",
            }
        )

        itemo = Item.create!(
            menu_id: 1,
            item_name: "crab cake",
            price: 999.99,
            category: "Breakfast, Lunch and Dinner."
        )
        

        carto.update("item_numbers": [1])
        # carto.item_numbers.push(1,1)
        
        puts('cartooooooo', cust.cart.inspect)

        # The order creation fails due to the validates order_items, line 11 on orders.rb
        order = Order.create!({
            "customer_id": 1,
            "business_id": 1,
            
        })

        

        it { should validate_presence_of(:customer_id) }
        it { should validate_presence_of(:business_id) }
        it { should validate_presence_of(:cart_id) }
        it { should validate_presence_of(:status) }
        it { should validate_presence_of(:cart_items_present?)}
        
    end

    
    
end
