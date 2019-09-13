class OrderMailer < ApplicationMailer
    def order_email(user)
        mail(to: user.email, subject: "Your order has been placed")
    end
end
