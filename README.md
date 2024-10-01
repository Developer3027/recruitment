# TRUCKERJOBS4U

A application built in Rails 7 for a start up truck driving recruiter company. This app is secured with the Devise gem. A admin model with roles is created. Admin role manages data collected by the app. Advisor role manages social media for the app. Home / root page collects email addresses for the newsletter, collects contact information for lead generation. Protect any submit of data in form with Privacy Policy check.

Data in admin dashboard can be sorted and organized. Search applies to specific fields. Admin can update notes attached to contact info. Admin can delete contact and newsletter information. Only admin can access admin dashboard.

Advisor can create, update, and delete blog posts. Blog forms include SEO information and guidance on specifications for images and character length. Only advisor can access advisor dashboard.

App must be mobile friendly for all but dashboards. Managing dashboards should address mobile concerns but may not be strictly mobile friendly.

Things you may want to cover:

* Ruby version
  * 3.2.2

* System dependencies
  * PostgreSQL
  * S3 - AWS
  * Pagy
  * Ransack
  * Action Text - system libraries

* Configuration
  * SendGrid config for smtp service of action mailer
  * Amazon in storage.yml for S3

* Database creation
  * In development - local with default credentials
  * In production - URL
  * bin/rails db:create

* Database initialization
  * seed - admin users for admin and advisor roles, blog, lead, newsletter.
  * db:create
  * db:migrate

* ...
