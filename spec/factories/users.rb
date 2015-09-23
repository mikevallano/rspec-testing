FactoryGirl.define do
  factory :user, :class => 'User' do
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
  end

  factory :admin, :class => 'User' do
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
    roles { [ FactoryGirl.create(:admin_role) ] }
  end

  factory :account_owner, :class => 'User' do
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
    roles { [ FactoryGirl.create(:account_owner_role) ] }
  end

  factory :manager, :class => 'User' do
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
    roles { [ FactoryGirl.create(:manager_role) ] }
  end

  factory :counselor, :class => 'User' do
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
    roles { [ FactoryGirl.create(:counselor_role) ] }
  end


end