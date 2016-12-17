Company.destroy_all
Job.destroy_all
Contact.destroy_all

COMPANIES = ["ESPN", "Aetna", "United Airlines", "Denver Public Schools", "Shopify", "Starbucks", "Pivotal Labs", "Captain U"]
JOBS = ["Engineering", "Development", "Dev Ops", "Quality Assurance", "Teacher", "Product Manager", "Consultant", "Community Manager"]
CITIES = ["Seattle", "Denver", "Portland", "Indianapolis", "Madison", "Orlando", "San Diego", "Austin", "Las Vegas", "Little Rock", "Boise", "Eugene", "Oakland"]
NAMES = ["Daniel", "Rosalia", "Jessica", "Amelia", "Bobby", "Thomas", "Leah", "Katerina"]
CATEGORIES = ["Software Development", "Finance", "Accounting", "Medical", "Retail"]

CATEGORIES.each do |title|
  Category.create!(title: title)
end

COMPANIES.each do |name|
  company = Company.create!(name: name)
  puts "Created #{company.name}"
  10.times do |num|
    company.jobs.create!(title: JOBS.sample, description: "What a great position!", level_of_interest: num + rand(100), city: CITIES.sample, category_id: Category.find_by(title: CATEGORIES.sample).id)
    puts "  Created #{company.jobs[num].title}"
  end
  5.times do |num|
    company.contacts.create!(name: NAMES.sample, position: "some position", email: "someemail@email.com")
  end
end

Job.all.each do |job|
  5.times do
  job.comments.create!(content: "Comment" + rand(100).to_s)
  end
end
