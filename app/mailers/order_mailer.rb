class OrderMailer < ApplicationMailer
    def order_email
        @user = params[:user]
        mail(to: @user.email, subject: "A New Order Has Been Made")
    end
end
