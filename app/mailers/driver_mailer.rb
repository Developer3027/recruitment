# Controller for sending emails to drivers
class DriverMailer < ApplicationMailer

  # Send a thank you email to the driver after submitting the form
  #
  # @param [Lead] pass the lead object with the email and other attributes
  def new_driver_email(lead)
    @lead = lead
    mail to: lead.email, subject: "Thank you for contacting us"
  end
end
