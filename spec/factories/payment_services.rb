# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :payment_service do
    name "Starbucks"
    code "sbux"
    app_id "sbux"
  end
end
