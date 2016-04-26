class PurchaseMailer < ApplicationMailer
  default :from => 'any_from_address@example.com'
  # layout 'mailer'
  def sample_email(user)
    # @user = current_user
    @items = user.items
    mail(to: "gurusundesh@khalsa.com", subject: 'Sample Email')
  end
end
