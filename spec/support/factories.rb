FactoryGirl.define do
  factory :job do
    company

    sequence :title do |n|
      "Job #{n}"
    end

    description "This is the job description."

    sequence :level_of_interest do |n|
      n
    end

    sequence :city do |n|
      "City #{n}"
    end

    category
  end

  factory :company do
    sequence :name do |n|
      "Company #{n}"
    end

    # factory :company_with_jobs do
    #   transient do
    #     jobs_count 3
    #   end
    #
    #   after(:create) do |company, evaluator|
    #     create_list(:job, evaluator.jobs_count, company: company)
    #   end
    # end
  end

  factory :category do
    sequence :title do |n|
      ["Web Development","Finance","Eductation"][n%3-1]
    end
  end

end
