FactoryGirl.define do
  factory :job do
    title
    description
    level_of_interest
  end

  sequence :title, ["A", "B", "C"].cycle do |n|
    "#{n} Title"
  end

  sequence :description, ["A", "B", "C"].cycle do |n|
    "#{n} Description"
  end

  sequence :level_of_interest, [10, 20, 60].cycle do |n|
    n
  end

  factory :company do
    sequence :name do |n|
      "#{n} Name"
    end
    sequence :city, ["Denver", "Chicago", "Phoenix"].cycle do |n|
      "#{n}"
    end


    factory :companies_with_jobs do
      jobs { create_list(:job, 3)}
    end
  end
end
