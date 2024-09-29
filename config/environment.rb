# Load the Rails application.
require_relative "application"

ActionMailer::Base.smtp_settings = {
  user_name: 'apikey',
  password: Rails.application.credentials.dig(:sendgrid, :sendgrid_password),
  domain: 'www.truckerjobs4u.com',
  address: 'smtp.sendgrid.net',
  port: 587,
  authentication: :plain,
  enable_starttls_auto: true
}

# Initialize the Rails application.
Rails.application.initialize!
