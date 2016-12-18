FactoryGirl.define do

  factory :contact do
    sequence(:name) {|n| "Bob_#{n}"}
    sequence(:position) {|n| "Janitor_#{n}"}
    sequence(:email) {|n| "poop_scooper_#{n}@janitor.com"}
    company
  end

  factory :city do
    sequence(:name) {|n| "City_#{n}"}
  end

  factory :comment do
    sequence(:content) {|n| "This is comment #{n}!"}
    sequence(:created_at) {Faker::Time.between(DateTime.now - 3, DateTime.now)}
    job
  end

  factory :job do
    sequence(:title) {|n| "Title_#{n}"}
    sequence(:description) {|n| "This is description #{n}."}
    sequence(:level_of_interest) {|n| "The level of interest is: #{n}"}
    category
    company
    city
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
