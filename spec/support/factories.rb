FactoryGirl.define do
  factory :job do
    title
    level_of_interest 80
    city "Denver"
    association :category
    association :company
  end

  sequence :title do |n|
    "#{n} Artist"
  end

  sequence :name do |n|
    "#{n} Artist"
  end

  factory :company do
    name
    factory :company_with_jobs do
      transient do
        jobs_count 3
      end
      after(:create) do |company, evaluator|
        create_list(:job, evaluator.jobs_count, company: company)
      end
    end
  end

  factory :category do
    title
  end
end
