FactoryGirl.define do

  factory :comment do
    sequence :content do |n| 
      Faker::GameOfThrones.character + n.to_s
    end
  end

  factory :job do
    title       {Faker::Book.title}
    description {Faker::Name.name}
    level_of_interest {Faker::Number.number(2)}
    company
    city        {Faker::GameOfThrones.city}
    category  

    factory :job_with_comments do
      after(:create) do |job|
        create_list(:comment, 10, job: job)
      end
    end
  end


  factory :contact do
    sequence :full_name do |n|
      Faker::GameOfThrones.character + n.to_s
    end
    position {Faker::GameOfThrones.house}
    email {Faker::Internet.email}
  end



  factory :company do
    sequence :name  do |n| 
      Faker::Company.name + n.to_s
    end

    factory :company_with_jobs do
      after(:create) do |company|
        create_list(:job, 10, company: company)
      end
    end

    factory :company_with_contacts do
      after(:create) do |company|
        create_list(:contact, 10, company: company)
      end
    end
    

    factory :company_with_jobs_with_comments do
      after(:create) do |company|
        create_list(:job_with_comments, 10, company: company)
      end
    end
  end

  factory :category do
    sequence :title  do |n| 
      Faker::Commerce.department + n.to_s
    end

    factory :category_with_jobs do
      after(:create) do |category|
        create_list(:job, 10, category: category)
      end
    end
  end

end
