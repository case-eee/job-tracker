Company.destroy_all
Job.destroy_all
Category.destroy_all
Contact.destroy_all

CATEGORIES = ["Web Development", "DevOps", "Startup", "Backend", "Full Stack"]
COMPANIES = ["ESPN", "Aetna", "United Airlines", "Denver Public Schools", "Shopify", "Starbucks", "Pivotal Labs", "Captain U"]
JOBS = ["Engineering", "Development", "Dev Ops", "Quality Assurance", "Teacher", "Product Manager", "Consultant", "Community Manager"]
CITIES = ["Seattle", "Denver", "Portland", "Indianapolis", "Madison", "Orlando", "San Diego", "Austin", "Las Vegas", "Little Rock", "Boise", "Eugene", "Oakland"]

CATEGORIES.each do |title|
  Category.create(title: title)
end

COMPANIES.each do |name|
  company = Company.create!(name: name)
  puts "Created #{company.name}"
  2.times do
    company.contacts.create(full_name: Faker::Name.name, email: Faker::Internet.email, position: Faker::Company.profession)
  end
  10.times do |num|
    company.jobs.create!(title: JOBS.sample, description: "What a great position!", level_of_interest: num + rand(100), city: CITIES.sample, category_id: (rand(CATEGORIES.count) + 1))
    puts "  Created #{company.jobs[num].title}"
  end
end
