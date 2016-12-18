FactoryGirl.define do
  factory :comment do
    sequence(:content) {|n| "This is comment #{n}!"}
    job
  end

  factory :job do
    sequence(:title) {|n| "Title_#{n}"}
    sequence(:description) {|n| "This is description #{n}."}
    sequence(:level_of_interest) {|n| "The level of interest is: #{n}"}
    sequence(:city) {|n| "City_#{n}"}
    category
    company
  end

  factory :category do
    sequence(:title) {|n| "Category_title_#{n}"}

    factory :category_jobs
    transient do
      jobs_count 5
    end

    after(:create) do |category,evaluator|
      create_list(:job, evaluator.jobs_count, category: category)
    end
  end

  factory :company do
    sequence(:name) {|n| "Company #{n}"}

    factory :company_jobs do
      transient do
        jobs_count 5
      end

      after(:create) do |company, evaluator|
        create_list(:job, evaluator.jobs_count, company: company)
      end
    end
  end
end
