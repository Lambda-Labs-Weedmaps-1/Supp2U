class StripeChargesServices
    DEFAULT_CURRENCY = 'usd'.freeze
    
    def initialize(params, business, stripe_ip)
      @stripe_token = params[:token]
      @amount = params[:amount]
      @business = business
      @stripe_business = stripe_business
      @stripe_ip = stripe_ip
    end
  
    def call
      create_charge(find_customer)
    end

    def busCall
      find_business()
    end
  
    private
  
    attr_accessor :customer, :stripe_email, :stripe_token, :item, :stripe_business, :business_token, :business
  
    def find_business
      if stripe_business
        retreive_business(business_token)
      else
        create_business
      end
    end

    def retrieve_business(business_token)
      Stripe::Account.retrieve(business_token) 
    end
    
    def create_business
      @stripe_business = Stripe::Account.create({
        type: 'custom',
        country: 'US',
        email: 'test@test.com',
        requested_capabilities: ['card_payments','transfers'],
      })

      business.update(stripe_token: @stripe_business.id)

      Stripe::Account.update(
        @stripe_business.id,
        {
          tos_acceptance: {
            date: Time.now.to_i,
            ip: @stripe_ip, 
          },
        }
      )
      puts @stripe_business
      puts "stripe business is right here!!!"
      puts @stripe_business.id
    end

    # CUSTOMER  # CUSTOMER  # CUSTOMER  # CUSTOMER  # CUSTOMER  # CUSTOMER  # CUSTOMER 
    def find_customer
        if customer
          retrieve_customer(stripe_token)
        else
          create_customer
        end
    end

    def retrieve_customer(stripe_token)
      Stripe::Customer.retrieve(stripe_token) 
    end
  
    def create_customer
      customer = Stripe::Customer.create(
        email: stripe_email,
        source: stripe_token
      )
    end
  
    def create_charge(customer)
      Stripe::Charge.create(
        customer: customer.id,
        amount: @amount.to_i,
        # description: "supp2u!",
        currency: DEFAULT_CURRENCY,
        transfer_data: {
          destination: "acct_1FJ0qeLHC02ycZnJ"
        },
      )
    end
end
  