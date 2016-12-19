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
    category = Category.find_by(title: CATEGORIES.sample)
    job = Job.new
    job.title = JOBS.sample
    job.description = "What a great position! Random number: #{rand(100000)}"
    job.level_of_interest = num + rand(95)
    job.city = CITIES.sample
    job.category = Category.new
    job.category = category
    job.save
    company.jobs << job
  end
end
