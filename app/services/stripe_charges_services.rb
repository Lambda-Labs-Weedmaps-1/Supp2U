class StripeChargesServices
    DEFAULT_CURRENCY = 'usd'.freeze
    
    def initialize(params, business)
      # @stripe_email = params[:stripeEmail]
      @stripe_token = params[:token]
      @amount = params[:amount]
      # @order = params[:order_id]
      # @customer = customer
      @business = business
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
      Stripe::Customer.retrieve(business_token) 
    end
    
    def create_business
      stripe_business = Stripe::Customer.create(
        email: stripe_email,
        source: business_token
      )
      business.update(stripe_token: stripe_business.id)
      puts stripe_business.id
      puts "THIS IS ITTTTT"
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
      puts "this works!!!!!!asdfkjas;kldfjas;kldfja;sdfjkl!!"
      puts customer
      puts params
    end
  
    def create_charge(customer, buisness)
      Stripe::Charge.create(
        customer: customer.id,
        amount: @amount,
        description: "supp2u!",
        currency: DEFAULT_CURRENCY,
        transfer_data: {
          destination: business.id,
        }
      )
    end
  
    def order_amount
      Item.find_by(id: order).price
    end
end
  