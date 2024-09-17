class NewsletterMailer < ApplicationMailer
  def new_newsletter_email(newsletter)
    @newsletter = newsletter
    mail to: newsletter.newsletter_email, subject: "Thank you for signing up!"
  end
end
