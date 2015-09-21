FactoryGirl.define do
  factory :customer do
    name { Faker::Name.name } #putting the faker call inside a block means it'll be called each time.
    email { Faker::Internet.email }
  end

end
