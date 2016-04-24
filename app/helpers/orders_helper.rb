module OrdersHelper
  def button_to_mark_order_completed(order)
    if order.ordered?
      link_to "Mark as Paid",
              admin_order_path(order),
              method: :patch,
              class: "waves-effect waves-light btn"
    elsif order.paid?
      link_to "Mark as Completed",
              admin_order_path(order),
              method: :patch,
              class: "waves-effect waves-light btn"
    end
  end

  def button_to_cancel_order(order)
    if order.cancelled?
      link_to "cancel order",
      "#",
      method: :patch,
      class: "waves-effect waves-light btn disabled"
    else
      link_to "cancel order",
      admin_cancel_path(order),
      method: :patch,
      class: "waves-effect waves-light btn"
    end
  end

end
