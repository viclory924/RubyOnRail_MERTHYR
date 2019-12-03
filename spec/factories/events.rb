# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    name "MyString"
    description "MyText"
    starts "2013-09-11 23:14:57"
    ends "2013-09-11 23:14:57"
    location_name "MyString"
    location_address "MyString"
    longitude 1.5
    latitude 1.5
    image "MyString"
  end
end
