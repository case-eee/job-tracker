FactoryGirl.define do
  factory :job do
    title
    level_of_interest 80
    city "Denver"
    association :category
    association :company
    factory :job_with_comments do
      transient do
        comment_count 3
      end
      after(:create) do |job, evaluator|
        create_list(:comment, evaluator.comment_count, job: job)
      end
    end
  end

  factory :comment do
    content
    association :job
  end

  sequence :title do |n|
    "#{n} Consultant"
  end

  sequence :name do |n|
    "#{n} Inc."
  end

  sequence :content do |n|
    "#{n} is the loneliest number"
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
