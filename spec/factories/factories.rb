FactoryGirl.define do
  factory :company do
    name
    factory :company_with_jobs do
      jobs {create_list(:job, 3)}
    end
  end

  factory :job do
    title
    description
    level_of_interest
    city 
    category_id {create(:category)}
  end

  factory :category do
    title {generate(:category_title)}
  end

  sequence :name, ["A", "B", "C", "D"].cycle do |n|
    "Company #{n}"
  end

  sequence :title do |n|
    "Title#{n}"
  end

  sequence :city do |n|
    "City#{n}"
  end

  sequence :category_title do |n|
    "Category #{n}"
  end

  sequence :description do |n|
    "Description#{n}"
  end

  sequence :level_of_interest, [10,25,67,89,55,9].cycle do |n|
    n 
  end

end