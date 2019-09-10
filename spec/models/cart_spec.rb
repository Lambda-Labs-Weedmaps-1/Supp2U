require 'rails_helper'

RSpec.describe Cart, type: :model do

    describe 'cart... stuff' do
        it { should belong_to(:customer).class_name('Customer') }
    end

    describe 'create cart' do

        it "creates correctly" do
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

            results = carto.valid?
            errors = carto.errors.full_messages

            puts(carto)
            expect(results).to be true
        end

    end

end
