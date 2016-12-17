FactoryGirl.define do
  factory :company do
    sequence :name do |n|
      "Company #{n}"
    end
  end

  factory :category do
    sequence :title do |n|
      "Category #{n}"
    end
  end
  factory :job do
    sequence :title do |n|
      "Title #{n}"
    end
    description "does some stuff"
    level_of_interest 10
    company
    city "Denver"
    category
  end

  factory :contact do
    sequence :name do |n|
      "Contact #{n}"
    end
    position "Recruiter"
    email "hiring@hire.com"
    company
  end

  factory :comment do
    sequence :content do |n|
      "Comment #{n} here"
    end
    job
  end
end
