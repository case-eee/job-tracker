# FactoryGirl.define do
#
#   sequence :name, ["A", "B", "C", "D"].cycle do |n|
#     "Company #{n}"
#   end
#
#   sequence :city do |n|
#     "City#{n}"
#   end
#
#   sequence :title do |n|
#     "Title#{n}"
#   end
#
#   sequence :description do |n|
#     "Description#{n}"
#   end
#
#   sequence :level_of_interest, [1, 2, 3, 4].cycle do |n|
#     n
#   end
#
#   factory :job do
#     title
#     description
#     level_of_interest
#     category {create(:category)}
#   end
#
#   factory :company do
#     name
#     city
#     factoy :company_with_jobs do
#       jobs {create_list(:job, 3)}
#     end
#   end
# end
