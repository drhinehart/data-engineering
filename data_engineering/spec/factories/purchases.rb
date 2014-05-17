# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :purchase do
    purchaser_id 1
    item_id 1
    quantity 1
  end
end
