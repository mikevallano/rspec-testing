FactoryGirl.define do
  factory :order do
    name {Faker::Commerce.product_name}
    description {Faker::Commerce.department}
    customer
  end

end
