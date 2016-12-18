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
end