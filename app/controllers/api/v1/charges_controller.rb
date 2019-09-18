module Api
    module V1
        class ChargesController < ApplicationController
            rescue_from Stripe::CardError, with: :catch_exception
            
            def new
            end
        
            def create
                business = Business.find(params[:business_id])
                stripe_ip = request.remote_ip
                @charge = StripeChargesServices.new(charges_params, business, stripe_ip)
                
                if @charge.call
                    render status: :ok, json: {message: "it workssssss!!!!!"}
                else
                    render status: 422, json: {message: "unprocessable entity"}
                end
            end

            private
        
            def charges_params
                params.permit(:stripeEmail, :stripeToken, :token, :amount, :business_id)
            end
        
            def catch_exception(exception)
                flash[:error] = exception.message
            end
        end
    end
end