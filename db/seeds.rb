# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create admin user.
User.create(email: "info@welovemerthyr.co.uk", password: 'merthyr123', password_confirmation: 'merthyr123', is_admin: true)
User.create(email: "ndgiang84@gmail.com", password: 'pass4test', password_confirmation: 'pass4test', is_admin: true)

