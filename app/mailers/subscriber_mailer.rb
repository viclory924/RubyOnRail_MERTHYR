class SubscriberMailer < ActionMailer::Base
  default from: "donotreply@welovemerthyr.co.uk"
  default to: "info@welovemerthyr.co.uk"

  def welcome_email(subscriber)
  	@subscriber = subscriber
  	mail(subject: "New subscriber" )
  end
end
