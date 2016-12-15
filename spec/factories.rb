FactoryGirl.define do
  factory :job do
    sequence(:title) {|n| "Title_#{n}"}
    sequence(:description) {|n| "This is description #{n}."}
    sequence(:level_of_interest) {|n| "The level of interest is: #{n}"}
    sequence(:city) {|n| "City_#{n}"}
  end

  factory :company do
    sequence(:name) {|n| "Company #{n}"}
  end
end
