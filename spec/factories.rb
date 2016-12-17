FactoryGirl.define do
  factory :job do
    sequence(:title) {|n| "Title_#{n}"}
    sequence(:description) {|n| "This is description #{n}."}
    sequence(:level_of_interest) {|n| "The level of interest is: #{n}"}
    sequence(:city) {|n| "City_#{n}"}
    category
  end

  factory :category do
    sequence(:title) {|n| "Category_title_#{n}"}
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
