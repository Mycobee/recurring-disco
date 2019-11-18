FactoryBot.define do
  factory :article do
    sequence(:title) { |n| "Title #{n}" }
    sequence(:body) { |n| "Lorem ipsum dolor sit amet, rebum putant ex has, et duo rebum saperet incorrupte. At tale dolores luptatum eum, id his libris copiosae philosophia, sumo putant reprimique id sit. Ut duo ferri oporteat concludaturque, id sumo clita laoreet nam. Sed labores scripserit in. #{n}" }
  end
end
