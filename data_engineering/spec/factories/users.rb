# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "user@example.com"
    password "Password1"
    password_confirmation "Password1"
  end
end
