class StripeChargesServices
    DEFAULT_CURRENCY = 'usd'.freeze
    
    def initialize(params, customer)
      @stripe_email = params[:stripeEmail]
      @stripe_token = params[:stripeToken]
      @order = params[:order_id]
      @customer = customer
    end
  
    def call
      create_charge(find_customer)
    end
  
    private
  
    attr_accessor :customer, :stripe_email, :stripe_token, :item
  
    def find_customer
        if customer.stripe_token
        retrieve_customer(customer.stripe_token)
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
      puts customer
      customer.update(stripe_token: customer.id)
      @customer
    end
  
    def create_charge(customer)
      Stripe::Charge.create(
        customer: customer.id,
        amount: 1000,
        description: customer.email,
        currency: usd,
      )
    end
  
    def order_amount
      Item.find_by(id: order).price
    end
end
  