module ApplicationHelper
  include CategoryHelper

  def link_to_login_or_logout
    if current_user
      link_to "Logout", logout_path, method: :delete
    else
      link_to "Login", login_path
    end
  end

  def checkout_or_create_account_button
    if current_user
      button_to "Checkout", invoices_path, class: "waves-effect waves-light btn"
    else
      button_to "Create Account to Checkout", login_path, method: "get", class: "waves-effect waves-light btn"
    end
  end
end
