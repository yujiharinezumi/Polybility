# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

CSV.foreach('db/csv/country.csv', headers: true) do |row|
  Country.create(
    name: row['name']
  )
end

CSV.foreach('db/csv/language.csv', headers: true) do |row|
  Language.create(
    name: row['name']
  )
end
