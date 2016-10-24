FactoryGirl.define do

  factory :company do
    name
    city

    factory :company_with_jobs do
      jobs { create_list(:job, 2) }
    end
  end

  factory :job do
    title
    description "Developer"
    level_of_interest
    company
    category {create(:category)}

    factory :job_with_tags do
      tags { create_list(:tag, 2) }
    end
  end

  factory :category do
    title
  end

  factory :contact do
    full_name "MyText"
    position "MyText"
    email "MyText"
    company nil
  end

  factory :tag do
    title

    factory :tag_with_jobs do
      jobs { create_list(:job, 2) }
    end
  end

  sequence :name do |n|
    "#{n} Company"
  end

  sequence :title do |n|
    "#{n} Job"
  end

  sequence :city do |n|
    "#{n} City"
  end

  sequence :level_of_interest do |n|
    "#{n} Level of Interest"
  end

end
