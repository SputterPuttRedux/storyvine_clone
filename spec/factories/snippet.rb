FactoryGirl.define do
  factory :snippet do
    association :user
    content "THIS IS A SNIPPET, WHADDUP"
  end
end
