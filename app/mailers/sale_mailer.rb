class SaleMailer < ApplicationMailer
    def sale_email(user)
        mail(to: user.email, subject: "You have an order.")
    end
end
