# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# destroy blogs
Blog.destroy_all
p "Confirmed #{Blog.count} blog articles records are left."

# destroy leads
Lead.destroy_all
p "Confirmed #{Lead.count} lead records are left."

# destroy newsletters
Newsletter.destroy_all
p "Confirmed #{Newsletter.count} newsletter records are left."

# destroy users
Admin.destroy_all
p "Confirmed #{Admin.count} User records are left."

#create admin with admin role
Admin.create!(email: "kathryn@truckerjobs4u.com", password: "password", role: 0)
p "Created one admin with admin role."

#create admin with advisor role
Admin.create!(email: "missy@truckerjobs4u.com", password: "password", role: 1)
p "Created one admin with advisor role."

# create blog
advisor_user = Admin.find_by(role: "advisor")
if advisor_user
  Blog.create!(title: "Hello World", content: "This is the first post", admin_id: advisor_user.id)
  p "Created #{Blog.count} blog posts"
else
  p "No advisor user found"
end
