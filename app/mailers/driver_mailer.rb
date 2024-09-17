class DriverMailer < ApplicationMailer
  def new_driver_email(lead)
    @lead = lead
    mail to: lead.email, subject: "Thank you for contacting us"
  end

  def new_user_driver_email(lead)
    @lead = lead
    mail to: lead.email, subject: "Thank you signing up!"
  end
end
