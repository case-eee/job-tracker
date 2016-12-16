FactoryGirl.define do
  factory :company do
    name "Turing School"
  end

  factory :job do
    title "Software Developer"
    description "writes code"
    level_of_interest 10
    city "Denver"
  end

  factory :category do
    title "Software Development"
  end
end
