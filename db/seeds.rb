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

# COMPANIES = ["ESPN", "Aetna", "United Airlines", "Denver Public Schools", "Shopify", "Starbucks", "Pivotal Labs", "Captain U"]
# JOBS = ["Engineering", "Development", "Dev Ops", "Quality Assurance", "Teacher", "Product Manager", "Consultant", "Community Manager"]
# CITIES = ["Seattle", "Denver", "Portland", "Indianapolis", "Madison", "Orlando", "San Diego", "Austin", "Las Vegas", "Little Rock", "Boise", "Eugene", "Oakland"]
# COMMENTS = ["I am interested.", "I am not interested.", "The culture here seems great.", "I like the job, but don't like the location.", "I should follow up with the manager.", "Check linkedin for any connections."]
#
# COMPANIES.each do |name|
#   company = Company.create!(name: name)
#   puts "Created #{company.name}"
#   10.times do |num|
#     company.jobs.create!(title: JOBS.sample, description: "What a great position!", level_of_interest: num + rand(100), city: CITIES.sample)
#     puts "Created #{company.jobs[num].title}"
#   end
# end
#
#
# Category.all.each do |category|
#   Job.all.each do |job|
#     job.update_attributes(category_id: category.id)
#   end
# end
#
# COMMENTS.each do |comment|
#   comment = Comment.create!(content: comment)
#   puts "Created #{comment.id}!"
# end
#
# Comment.all.each do |comment|
#   Job.all.each do |job|
#     comment.update_attributes(job_id: job.id)
#   end
# end
