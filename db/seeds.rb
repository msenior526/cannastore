# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create(name: "Indica")
Category.create(name: "Sativa")
Category.create(name: "Hybrid")

100.times do 
    Strain.create(
        name: Faker::Cannabis.strain,
        thc_content: Faker::Number.between(from: 10, to: 30),
        description: Faker::Quote.yoda,
        category_id: Faker::Number.between(from: 1, to: 3)
    )
end

300.times do
    Review.create(
        context: Faker::Lorem.paragraph(sentence_count: 4),
        rating: Faker::Number.between(from: 1, to: 10),
        user_id: Faker::Number.between(from: 1, to: User.all.count),
        strain_id: Faker::Number.between(from: 1, to: Strain.all.count)
    )
end


