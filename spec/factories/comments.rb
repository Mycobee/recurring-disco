FactoryBot.define do
  factory :comment do
    article { nil }
    body { "MyText" }
    user { nil }
  end
end
