FactoryGirl.define do
  factory :user, :class => 'User' do
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'

      factory :admin do
        roles { [ FactoryGirl.create(:admin_role) ] }
      end

      factory :account_owner do
        roles { [ FactoryGirl.create(:account_owner_role) ] }
      end

      factory :manager do
        roles { [ FactoryGirl.create(:manager_role) ] }
      end

      factory :counselor do
        roles { [ FactoryGirl.create(:counselor_role) ] }
      end

  end

end
