FactoryBot.define do
  factory :user do
    name { "MyString" }
    email { "MyString" }
    password_digest { "MyString" }
    street_address { "MyString" }
    city { "MyString" }
    state { "MyString" }
    zip_code { 1 }
    recurring { false }
  end
end
