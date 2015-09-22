FactoryGirl.define do
  factory :user do
    name "Cesar"
    sequence(:email, 100) { |n| "person#{n}@example.com" }
    password 'helloworld'
    password_confirmation 'helloworld'
  end
end
