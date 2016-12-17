Company.destroy_all
Job.destroy_all

COMPANIES = ["ESPN", "Aetna", "United Airlines", "Denver Public Schools", "Shopify", "Starbucks", "Pivotal Labs", "Captain U"]
JOBS = ["Engineering", "Development", "Dev Ops", "Quality Assurance", "Teacher", "Product Manager", "Consultant", "Community Manager"]
CITIES = ["Seattle", "Denver", "Portland", "Indianapolis", "Madison", "Orlando", "San Diego", "Austin", "Las Vegas", "Little Rock", "Boise", "Eugene", "Oakland"]
CATEGORIES = ["Web Development", "Software Engineering", "Sales", "Account Management", "Consultancy"]

Company.delete_all
Job.delete_all
Category.delete_all

CATEGORIES.each do |category|
  category = Category.create!(title: category)
end

COMPANIES.each do |name|
  company = Company.create!(name: name)
  puts "Created #{company.name}"
  5.times do |num|
    company.jobs.create!(title: JOBS.sample, description: "What a great position!", level_of_interest: num + rand(100), city: CITIES.sample)
    puts "  Created #{company.jobs[num].title}"
  end
end

puts "Matching jobs with categories"
all_jobs = Job.all
all_jobs.each do |job|
  category = Category.find_by(title: CATEGORIES.sample)
  job.category = Category.new
  job.category = category
  job.save
  puts "Linked job #{job.title} with category #{category.title}"
end