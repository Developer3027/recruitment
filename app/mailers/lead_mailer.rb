# Contorller for sending emails to admin
class LeadMailer < ApplicationMailer
  # send email to all the admins whenever a new lead is generated
  def new_lead_email(lead)
    @lead = lead
    admins = Admin.where(role: 0)
    puts "admin emails: #{admins.pluck(:email)}"
    mail to: admins.pluck(:email), subject: 'TruckerJobs4U - New Lead Generated'
  end
end
