# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :retailer do
    store_number "MyString"
    name "MyString"
    address "MyText"
    city "MyString"
    state "MyString"
    zip_code "MyString"
    phone_number "MyString"
    fax_number "MyString"
    store_hours "MyText"
    services "MyString"
  end
end
