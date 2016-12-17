FactoryGirl.define do

  sequence :name, ["ESPN", "Disney"].cycle do |n|
    "#{n}"
  end

  sequence :title, ["Web Developer", "QA Analyst"].cycle do |n|
    "#{n}"
  end
  
  sequence :level_of_interest, [90, 70].cycle do |n|
    "#{n}"
  end
  
  sequence :city, ["Denver", "New York City"].cycle do |n|
    "#{n}"
  end
  
  factory :job do
    title
    level_of_interest
    city
  end

  factory :company do
    name
  end

  factory :category do
    title
  end

end