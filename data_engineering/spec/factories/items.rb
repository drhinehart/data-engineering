# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    description "10 off $20 of food"
    price 10.0
  end
end
