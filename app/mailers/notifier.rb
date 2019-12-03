class Notifier < ActionMailer::Base
  default from: "info@welovemerthyr.co.uk"
  ADMIN_EMAIL = 'info@welovemerthyr.co.uk'

  BCC_FOR_TEST = 'nuwanchaturanga@gmail.com'

  def invitation_to_business(email, business)
    @email = email
    @business = business

    mail subject: "Invitation to join #{business.name}",
         to: email,
         bcc: BCC_FOR_TEST
  end

  def new_deal_created(deal)
    @deal = deal

    mail subject: 'New deal created',
         to: ADMIN_EMAIL,
         bcc: BCC_FOR_TEST
  end
end
