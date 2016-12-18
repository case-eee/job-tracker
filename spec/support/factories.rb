FactoryGirl.define do

  factory :job do
    sequence :title, ["Web Developer", "QA Analyst"].cycle do |n|
      "#{n}"
    end
    sequence :level_of_interest, [90, 70].cycle do |n|
      "#{n}"
    end
    sequence :city, ["Denver", "New York City"].cycle do |n|
      "#{n}"
    end
    category {create(:category)}
  end

  factory :company do
    sequence :name, ["ESPN", "Disney"].cycle do |n|
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