require 'rails_helper'

# Validations what makes a business a business
RSpec.describe Business, type: :model do
	it 'is valid with valid attributes' do
		expect(
			Business.new(
				user_id: 10,
				name: "Angelo's Taverna",
				website: 'angelosdenver.com',
				city: 'Denver',
				state: 'CO',
				street: '620 E 6th Ave',
				zipcode: 80_203,
				theme: 'American',
				description: "Angelo's Yo !",
				lat: '39.725465',
				long: '-104.979174'
			)
		).to be_valid
	end
	it 'is not valid without a name' do
		business = Business.new(name: nil)
		expect(business).to_not be_valid
	end
	it 'is not valid without a city' do
	end
	it 'is not valid without a state' do
	end
	it 'is not valid without a street' do
	end
	it 'is not valid without a zipcode' do
	end
end
