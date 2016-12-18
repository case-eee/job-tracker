Company.destroy_all
Job.destroy_all
Category.destroy_all
City.destroy_all
Comment.destroy_all
Contact.destroy_all

20.times do
  Company.create!(name: Faker::Company.name)
end

10.times do
  City.create!(name:Faker::Address.city)
end

CATEGORIES = ["Web Development", "Software Engineering", "Education", "Community Affairs", "Finance"]

CATEGORIES.each do |title|
  Category.create!(title: title)
end

30.times do
  Job.create!(title:Faker::Name.title,description: Faker::Hipster.sentence(3), level_of_interest:Faker::Number.between(1, 10), company_id:Faker::Number.between(1, 20), category_id: Faker::Number.between(1, 5), city_id: Faker::Number.between(1, 10) )
end

30.times do
  Comment.create!(content:Faker::ChuckNorris.fact, job_id: Faker::Number.between(1, 30))
end

15.times do
  Contact.create!(name: Faker::GameOfThrones.character, position: Faker::Name.title, email: Faker::Internet.email, company_id:Faker::Number.between(1, 20))
end
