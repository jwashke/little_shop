class ItemSender < ApplicationMailer

  def send_order(user, order)
    @order = order
    @user  = user
    @items = @order.items
    mail(to: @user.email, subject: 'Purchased Goods')
  end
end
