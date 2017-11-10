class UserMailer < ApplicationMailer
    default from: 'no-reply@jungle.com'

    def order_email(order, item)
        @order = order
        @item = item
        mail(to: @order.email, subject: "Order comfirmation for order #{@order.id}")

    end
end
