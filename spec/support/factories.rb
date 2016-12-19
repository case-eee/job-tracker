FactoryGirl.define do

  factory :job do
    sequence :title, ["Web Developer", "QA Analyst", "Tester", "Big Boss"].cycle do |n|
      "#{n}"
    end
    sequence :level_of_interest, [1, 1, 1, 1].cycle do |n|
      "#{n + rand(1..99)}"
    end
    sequence :city, ["New York City", "Denver", "FarFarAway", "Not Here"].cycle do |n|
      "#{n}"
    end
    category {create(:category)}
  end

  factory :company do
    sequence :name, ["ESPN", "Disney", "Another Company", "Best Company"].cycle do |n|
      "#{n}"
    end
  end

  factory :contact do
    name {rand(1..1000000)}
    position {rand(1..1000000)}
    email {rand(1..1000000)}
  end

  factory :category do
    title {rand(1..1000000)}
    # sequence :title, ["Programming", "Quality"].cycle do |n|
    #   "#{n}"
    # end
    # transient do
    #   jobs_count 1
    # end
    # factory :category_with_jobs do
    #   before(:create) do |category, evaluator|
    #     create_list(:job, evaluator.jobs_count, category: category)
    #   end
    # end
  end

end