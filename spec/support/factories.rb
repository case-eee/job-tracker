# FactoryGirl.define do
# factory :job do
#    title              {Faker::Book.title}
#    description        {Faker::Name.name}
#    level_of_interest  {Faker::Number.number(2)}
#    city               {Faker::GameOfThrones.city}
#    company
#    category
#  end
#
#  factory :category do
#    name
#  end
#
#  factory :company do
#    sequence :name  do |n|
#      Faker::Company.name + n.to_s
#    end
#
#    factory :company_with_jobs do
#      after(:create) do |company|
#        create_list(:job, 10, company: company)
#      end
#    end
#  end
# end
