# Controller for sending emails to newsletter subscribers
class NewsletterMailer < ApplicationMailer
  # Send a thank you email to a new newsletter subscriber.
  #
  # @param [Newsletter] The newsletter subscriber to send the email to.
  def new_newsletter_email(newsletter)
    @newsletter = newsletter
    mail to: newsletter.email, subject: "Thank you for signing up!"
  end
end
