module ItemsHelper
  def checkout_or_create_account_button
    if current_user
      button_to "Checkout", invoices_path, class: "waves-effect waves-light btn"
    else
      button_to "Create Account to Checkout", login_path, method: "get", class: "waves-effect waves-light btn"
    end
  end

  def button_to_change_item_state(item)
    if item.active?
      link_to "Retire",
              admin_retire_path(item),
              method: :patch,
              class: "waves-effect waves-light btn"
    else
      link_to "Activate",
              admin_activate_path(item),
              method: :patch,
              class: "waves-effect waves-light btn"
    end
  end
end
