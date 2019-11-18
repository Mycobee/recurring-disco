FactoryBot.define do
  factory :user, class: User do
    sequence(:email) { |n| "user_#{n}@gmail.com" }
    password { "password" }
    role { 0 }
    sequence(:name) { |n| "User Name #{n}" }
    sequence(:street_address) { |n| "Address #{n}" }
    sequence(:city) { |n| "City #{n}" }
    sequence(:state) { |n| "State #{n}" }
    sequence(:zip_code) { |n| n }
    recurring { true }
  end

  factory :inactive_user, parent: :user do
    sequence(:name) { |n| "Inactive User Name #{n}" }
    sequence(:email) { |n| "inactive_user_#{n}@gmail.com" }
    recurring { false }
  end

  factory :admin, parent: :user do
    sequence(:email) { |n| "admin_#{n}@gmail.com" }
    sequence(:name) { |n| "Admin Name #{n}" }
    role { 1 }
    recurring { true }
  end
end
