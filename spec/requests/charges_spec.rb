require 'rails_helper'

RSpec.describe "ChargesController", type: :controller do

    it "generates a stripe card token" do
        card_token = StripeMock.generate_card_token(last4: "4242", exp_year: 2020)
      
        cus = Stripe::Customer.create(source: card_token)
        card = cus.sources.data.first
        expect(card.last4).to eq("4242")
        expect(card.exp_year).to eq(2020)
    end
    
    describe "account actions" do
        it 'retrieves a stripe account', live: true do
            account = Stripe::Account.retrieve
    
            expect(account).to be_a Stripe::Account
            expect(account.id).to match /acct\_/
        end

        it 'retrieves a specific stripe account' do
            account = Stripe::Account.retrieve('acct_103ED82ePvKYlo2C')
      
            expect(account).to be_a Stripe::Account
            expect(account.id).to match /acct\_/
        end

        # it 'retrieves all' do
        #     accounts = Stripe::Account.all
      
        #     expect(accounts).to be_a Stripe::ListObject
        #     expect(accounts.data.count).to satisfy { |n| n >= 1 }
        # end
    end
end