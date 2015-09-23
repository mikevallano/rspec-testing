FactoryGirl.define do
  factory :role do
  name "rolename"

    factory :admin_role do
      name "admin"
    end

    factory :account_owner_role do
      name "account owner"
    end

    factory :manager_role do
      name "manager"
    end

    factory :counselor_role do
      name "counselor"
    end
end

end
