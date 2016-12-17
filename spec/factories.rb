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
end
