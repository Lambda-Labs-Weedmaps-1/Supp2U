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
        describe 'create account' do
            it 'creates one more account' do
              account = Stripe::Account.create(email: 'lol@what.com')
        
              expect(account).to be_a Stripe::Account
            end
            it 'create managed account' do
              account = Stripe::Account.create(managed: true, country: 'CA')
        
              # expect(account).to include(:keys)
              expect(account.keys).not_to be_nil
              expect(account.keys.secret).to match /sk_(live|test)_[\d\w]+/
              expect(account.keys.publishable).to match /pk_(live|test)_[\d\w]+/
              expect(account.external_accounts).not_to be_nil
              expect(account.external_accounts.data).to be_an Array
              expect(account.external_accounts.url).to match /\/v1\/accounts\/.*\/external_accounts/
            end
        end
    end
    context 'sends tos and deactivates' do
        let(:error_message) { "ToS acceptance date is not valid. Dates are expected to be integers, measured in seconds, not in the future, and after 2009" }
  
        it 'raises error when tos date is before 2009' do
          date = Date.new(2008,1,1).strftime("%s").to_i
  
          account = Stripe::Account.retrieve
          account.tos_acceptance.date = date
  
          expect {
            account.save
          }.to raise_error Stripe::InvalidRequestError, error_message
        end
  
        it 'raises error when tos date is in the future' do
          year = Time.now.year + 5
          date = Date.new(year,1,1).strftime("%s").to_i
  
          account = Stripe::Account.retrieve
          account.tos_acceptance.date = date
  
          expect {
            account.save
          }.to raise_error Stripe::InvalidRequestError, error_message
        end

        it 'deauthorizes account', live: false do
            account = Stripe::Account.retrieve
            result = account.deauthorize('CLIENT_ID')
        
            expect(result).to be_a Stripe::StripeObject
            expect(result[:stripe_user_id]).to eq account[:id]
        end
    end

    
end