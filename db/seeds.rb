Company.destroy_all
Job.destroy_all

COMPANIES = ["ESPN", "Aetna", "United Airlines", "Denver Public Schools", "Shopify", "Starbucks", "Pivotal Labs", "Captain U", "Netflix", "Comcast", "Southwest Airlines", "PepsiCo"]
JOBS = ["Engineering", "Development", "Dev Ops", "Quality Assurance", "Teacher", "Product Manager", "Consultant", "Community Manager", "Janitor", "Assistant Professor"]
CITIES = ["Seattle", "Denver", "Portland", "Indianapolis", "Madison", "Orlando", "San Diego", "Austin", "Las Vegas", "Little Rock", "Boise", "Eugene", "Oakland", "Denver", "Colorado Springs", "Rochester"]
CATEGORIES = ["Software Developement", " Janitorial", "Education", "Consulting", "Manual Labor", "Marketing", "Academic"]
CATEGORY_KEYS = [1, 2, 3, 4, 5, 6, 7] 
CATEGORIES.each do |title|
  Category.create!(title: title)
end

COMPANIES.each do |name|
  company = Company.create!(name: name)
  puts "Created #{company.name}"
  10.times do |num|
    company.jobs.create!(title: JOBS.sample, description: "a job that you can do for money", level_of_interest: num + rand(100), city: CITIES.sample, category_id: CATEGORY_KEYS.sample)
    puts " Created #{company.jobs[num].title}"
  end
end
