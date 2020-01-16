# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

CSV.foreach('db/csv/country.csv', headers: true) do |row|
  Country.create!(
    name: row['name']
  )
end

CSV.foreach('db/csv/language.csv', headers: true) do |row|
  Language.create!(
    name: row['name']
  )
end

CSV.foreach('db/csv/hobby.csv', headers: true) do |row|
  Label.create!(
    hobby: row['hobby']
  )
end


30.times do |user|

   name = Faker::Name.unique.name
   email = Faker::Internet.email
   password = "password"

   User.create!(name: name,
                email: email,
                password: password,
                password_confirmation: password,
                )

 end

# 管理者の作成
 User.create!(name: "admin_user",
            email: "admin_user@gmail.com",
            password: "adminadmin",
            password_confirmation: "adminadmin",
            admin: true
            )
