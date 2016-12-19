FactoryGirl.define do

  factory :category do
    title
  end

  sequence :title do |n|
    "#{n} Title"
  end

  sequence :name do |n|
    "#{n} Name"
  end

  factory :company do |n|
    name

    factory :company_with_contact_and_job do 
      transient do
        jobs_count 1
      end
      
      after(:create) do |company, evaluator|
        create(:contact, company: company)
        create_list(:job, evaluator.jobs_count, company: company)
      end

    end
  end

  factory :job do
    title
    description "So Cool"
    sequence :level_of_interest do |n|
      n
    end
    city "Denver, CO"
    category
    company
    
    factory :job_with_comments do
      transient do
        comment_count 2
      end

      after(:create) do |job, evaluator|
        create_list(:comment, evaluator.comment_count, job: job)
      end
    end
  end

  factory :comment do
    sequence :content do |n|
      "#{n} comment"
    end
  end

  factory :contact do
    sequence :full_name do |n|
      "#{n} name"
    end

    sequence :position do |n|
      "#{n} position"
    end

    sequence :email do |n|
      "#{n}@factory.com"
    end
  end
end