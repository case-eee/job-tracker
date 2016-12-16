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
  end
end