FactoryGirl.define do
  factory :post do
    title { Faker::Lorem.words(3) } #putting the faker call inside a block means it'll be called each time.
    content { Faker::Lorem.sentence(3) }
    published false
  end

end
