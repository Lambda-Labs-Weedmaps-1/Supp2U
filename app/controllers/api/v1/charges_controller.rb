module Api
    module V1
        class ChargesController < ApplicationController
            rescue_from Stripe::CardError, with: :catch_exception
            def new
            end
        
            def create
                @charge = StripeChargesServices.new(charges_params)
                if @charge.call
                    render status: :ok, json: {message: "it workssssss!!!!!"}
                else
                    render status: 422, json: {message: "unprocessable entity"}
                end
            end

            private

            # def charges_params
            #     params.permit(:stripeEmail, :stripeToken, :token, :charge)
            # end
        
            def charges_params
                params.permit(:stripeEmail, :stripeToken, :token, :amount)
            end
        
            def catch_exception(exception)
                flash[:error] = exception.message
            end
        end
    end
end