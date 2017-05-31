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

3.times do
  Category.create!(title: Faker::Book.genre)
end

authors = Author.all
categories = Category.all

for category in categories do
  Faker::Number.between(1, 2).times do
    category.children.create!(title: Faker::Book.genre)
  end
end

categories = Category.all

novels = Novel.all
for novel in novels do
  Faker::Number.between(1, 3).times do
    novel.add_author authors.sample
  end

  Faker::Number.between(1, 3).times do
    novel.add_category categories.sample
  end

end

comics = Comic.all
for comic in comics do
  Faker::Number.between(1, 3).times do
    comic.add_author authors.sample
  end

  Faker::Number.between(1, 3).times do
    comic.add_category(categories.sample)

  end
end