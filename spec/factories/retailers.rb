# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :retailer do
    store_number "1"
    name "Store 24"
    address "123 Main Street"
    city "Cambridge"
    state "MA"
    zip_code "02124"
    phone_number "555-1212"
    fax_number "555-2121"
    store_hours "9-5pm"
    services "Food"
    latitude 42.1
    longitude -80.2
  end
end
