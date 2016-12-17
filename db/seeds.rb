Company.destroy_all
Job.destroy_all

COMPANIES = ["ESPN", "Aetna", "United Airlines", "Denver Public Schools", "Shopify", "Starbucks", "Pivotal Labs", "Captain U"]
JOBS = ["Engineering", "Development", "Dev Ops", "Quality Assurance", "Teacher", "Product Manager", "Consultant", "Community Manager"]
CITIES = ["Seattle", "Denver", "Portland", "Indianapolis", "Madison", "Orlando", "San Diego", "Austin", "Las Vegas", "Little Rock", "Boise", "Eugene", "Oakland"]
CATEGORIES = ["Web Development", "Software Engineering", "Education", "Community Affairs", "Finance"]
COMMENTS = ["I am interested.", "I am not interested.", "The culture here seems great.", "I like the job, but don't like the location.", "I should follow up with the manager.", "Check linkedin for any connections."]

COMPANIES.each do |name|
  company = Company.create!(name: name)
  puts "Created #{company.name}"
  10.times do |num|
    company.jobs.create!(title: JOBS.sample, description: "What a great position!", level_of_interest: num + rand(100), city: CITIES.sample)
    puts "Created #{company.jobs[num].title}"
  end
end

CATEGORIES.each do |title|
  category = Category.create!(title: title)
  puts "Created #{category.title}"
end

Category.all.each do |category|
  Job.all.each do |job|
    job.update_attributes(category_id: category.id)
  end
end

COMMENTS.each do |comment|
  comment = Comment.create!(content: comment)
  puts "Created #{comment.id}!"
end

Comment.all.each do |comment|
  Job.all.each do |job|
    comment.update_attributes(job_id: job.id)
  end
end
