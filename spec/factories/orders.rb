FactoryGirl.define do
  factory :order do
    name { Faker::Company.name }
    description { Faker::Company.bs }
    customer
  end

end
