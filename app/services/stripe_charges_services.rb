class StripeChargesServices
    DEFAULT_CURRENCY = 'usd'.freeze
    
    def initialize(params)
      # @stripe_email = params[:stripeEmail]
      @stripe_token = params[:token]
      @amount = params[:amount]
      # @order = params[:order_id]
      # @customer = customer
    end
  
    def call
      create_charge(find_customer)
    end

    def busCall
      create_customer()
    end
  
    private
  
    attr_accessor :customer, :stripe_email, :stripe_token, :item
  
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
    end
  
    def create_charge(customer)
      Stripe::Charge.create(
        customer: customer.id,
        amount: @amount,
        description: "supp2u!",
        currency: DEFAULT_CURRENCY,
      )
    end
  
    def order_amount
      Item.find_by(id: order).price
    end
end
  