# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


100.times do
  User.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: '1'
  )

  Novel.create!(
      title: Faker::Name.name,
      description: Faker::Lorem.paragraph,
  )

  Comic.create!(
      title: Faker::Name.name,
      description: Faker::Lorem.paragraph,
  )

  Author.create!(
      name: Faker::Name.unique.name,
      bio: Faker::Lorem.paragraph
  )


end

# books = Book.all()
# for book in books do
#   Faker::Number.between(1, 3).times do
#     book.authors.create!(
#         name: Faker::Name.unique.name,
#         bio: Faker::Lorem.paragraph
#     )
#   end
#
#   Faker::Number.between(1, 3).times do
#     user = User.find(Faker::Number.between(1, 100))
#     book.comments.create!(
#         comment: Faker::Lorem.paragraph,
#         user: user
#     )
#   end
#
#   Faker::Number.between(1, 3).times do
#     user = User.find(Faker::Number.between(1, 100))
#     book.reviews.create!(
#         vote: Faker::Number.decimal(1, 1),
#         review: Faker::Lorem.paragraph,
#         user: user
#     )
#
#   end
#
# end
#
# 3.times do
#   Category.create!(title: Faker::Book.genre)
# end
#
# categories = Category.all()
#
# for category in categories do
#   Faker::Number.between(1, 2).times do
#     category.children.create!(title: Faker::Book.genre)
#   end
# end
#
# categories = Category.all()
#
# for book in books do
#
#   Faker::Number.between(1, 3).times do
#     book.add_category(categories.sample)
#   end
#
# end