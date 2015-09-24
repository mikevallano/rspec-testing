FactoryGirl.define do
  factory :store do
    name { Faker::Company.name }
    description { Faker::Company.catch_phrase }
  end

end
